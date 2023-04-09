//
//  FileManager-DocumentsDirectory.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
