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
        }
        
        func save(image: UIImage) -> Bool {
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
                
                return true
            }
        }
    }
}
