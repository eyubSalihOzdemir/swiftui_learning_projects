//
//  ImageEdit.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import SwiftUI

struct ImageEdit: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = ViewModel()
    var image: UIImage
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack(alignment: .top) {
                        Spacer()
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: min(image.size.width, 400), height: min(image.size.height, 300))
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                
                Section {
                    TextField("Name", text: $viewModel.name)
                } header: {
                    Text("Name of the item/person")
                        .textCase(nil)
                }
            }
            .navigationTitle("What/Who is this?")
            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.alertMessage)
            }
            .toolbar {
                Button("Save") {
                    if viewModel.save(image: image) {
                        // create CoreData object and save it with id
                        let newImage = CoreDataImage(context: moc)
                        newImage.id = viewModel.id
                        newImage.name = viewModel.name
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ImageEdit_Previews: PreviewProvider {
    static var previews: some View {
        ImageEdit(image: UIImage(systemName: "plus")!)
    }
}
