//
//  DetailedView.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import SwiftUI
import MapKit

struct LocationAnnotation: Identifiable {
    let id = UUID()
    var latitude: Double
    var longitude: Double
}

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
    
    @State private var mapRegion: MKCoordinateRegion
    private var annotationList = [LocationAnnotation]()
    
    init(cdImage: CoreDataImage, uiImage: UIImage) {
        self.cdImage = cdImage
        self.uiImage = uiImage
        
        let location = CLLocationCoordinate2D(latitude: cdImage.latitude, longitude: cdImage.longitude)
        self._mapRegion = State(wrappedValue: MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
        self._name = State(wrappedValue: cdImage.wrappedName)
        
        self.annotationList.append(LocationAnnotation(latitude: location.latitude, longitude: location.longitude))
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
                } else {
                    Text("\(cdImage.wrappedName)")
                }
            }
            
            Spacer()
            
            if cdImage.hasLocation {
                
                Map(coordinateRegion: $mapRegion, annotationItems: annotationList) { annotation in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: annotation.latitude, longitude: annotation.longitude)) {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                            .overlay {
                                Circle()
                                    .foregroundColor(.blue)
                                    .scaleEffect(0.6)
                            }
                    }
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .disabled(true)
            }
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
