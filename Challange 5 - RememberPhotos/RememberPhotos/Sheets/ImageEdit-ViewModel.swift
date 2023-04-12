//
//  ImageEdit-ViewModel.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import Foundation
import SwiftUI
import CoreData

extension ImageEdit {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var id = UUID()
        @Published var name = ""
        
        @Published var showingAlert = false
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        
        init() {
            LocationFetcher.shared.start()
        }
        
        func save(image: UIImage, context: NSManagedObjectContext) -> Bool {
            if name.isEmpty {
                alertTitle = "You can't save!"
                alertMessage = "Name can not be empty!"
                showingAlert = true
                
                return false
            } else {
                // created an id
                
                // save the image to documents with id
                let savePath = FileManager.documentsDirectory.appendingPathExtension("\(id)")
                if let jpegData = image.jpegData(compressionQuality: 0.8) {
                    try? jpegData.write(to: savePath, options: [.atomic, .completeFileProtection])
                } else {
                    print("Could not save image to local.")
                    return false
                }
                
                let newImage = CoreDataImage(context: context)
                newImage.id = id
                newImage.name = name
                if let loc = LocationFetcher.shared.savedLocation {
                    newImage.latitude = Double(loc.latitude)
                    newImage.longitude = Double(loc.longitude)
                    newImage.hasLocation = true
                }
                
                try? context.save()
                
                LocationFetcher.shared.savedLocation = nil
                
                return true
            }
        }
    }
}
