//
//  ContenView-ViewModel.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var inputImage: UIImage?
        
        @Published var showingImagePicker = false
        @Published var showingImageEditSheet = false
        
        init() { }
        
        func loadImageFromDocumentsDirectory(id: UUID) -> UIImage? {
            let savePath = FileManager.documentsDirectory.appendingPathExtension("\(id)")
            if let imageData = try? Data(contentsOf: savePath) {
                return UIImage(data: imageData)
            } else {
                return nil
            }
        }
    }
    
    
}
