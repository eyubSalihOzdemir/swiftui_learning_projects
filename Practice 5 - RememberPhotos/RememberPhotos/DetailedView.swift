//
//  DetailedView.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct DetailedView: View {
    @Environment(\.managedObjectContext) private var moc
    
    private var cdImage: CoreDataImage
    private var uiImage: UIImage
    
    @State private var name: String
    @State private var textfieldDisabled = true
    @FocusState private var textfieldIsFocused: Bool
    
    init(cdImage: CoreDataImage, uiImage: UIImage) {
        self.cdImage = cdImage
        self.uiImage = uiImage
        
        self._name = State(wrappedValue: cdImage.wrappedName)
    }
    
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        VStack {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: min(uiImage.size.width, 400), height: min(uiImage.size.height, 300))
            
            HStack {
                if editMode?.wrappedValue.isEditing == true {
                    TextField("\(cdImage.wrappedName)", text: $name)
                        .focused($textfieldIsFocused)
                        .font(.title)
                } else {
                    Text("\(cdImage.wrappedName)")
                        .font(.title)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Image Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                EditButton()
            }
        }
        .onChange(of: editMode!.wrappedValue, perform: { value in
          if value.isEditing {
             textfieldIsFocused = true
          } else {
              cdImage.name = name
              try? moc.save()
          }
        })
        
    }
}

//struct DetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailedView(uiImage: UIImage(systemName: "plus")!)
//    }
//}
