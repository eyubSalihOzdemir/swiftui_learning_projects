//
//  ContentView.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @StateObject private var viewModel = ViewModel()
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name)
    ]) var cdImages: FetchedResults<CoreDataImage>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cdImages, id: \.id) { cdImage in
                        if let image = viewModel.loadImageFromDocumentsDirectory(id: cdImage.wrappedID) {
                            NavigationLink {
                                DetailedView(cdImage: cdImage, uiImage: image)
                            } label: {
                                HStack {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)

                                    Text(cdImage.wrappedName)
                                }
                            }
                        }
                    }
                    .onDelete(perform: deleteImages)
                }
                
            }
            .navigationTitle("RememberPhotos")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        viewModel.showingImagePicker = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $viewModel.showingImagePicker) {
                ImagePicker(image: $viewModel.inputImage)
            }
            .onChange(of: viewModel.inputImage) { _ in
                viewModel.showingImageEditSheet = true
            }
            .sheet(isPresented: $viewModel.showingImageEditSheet) {
                if let unwrappedImage = viewModel.inputImage {
                    ImageEdit(image: unwrappedImage)
                    //ImageEdit(image: UIImage(systemName: "plus")!)
                }
            }
        }
    }
    
    func deleteImages(at offsets: IndexSet) {
            for offset in offsets {
                let image = cdImages[offset]
                moc.delete(image)
            }
            
            try? moc.save()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
