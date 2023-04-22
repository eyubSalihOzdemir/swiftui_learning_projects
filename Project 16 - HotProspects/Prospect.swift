//
//  Prospect.swift
//  HotProspects
//
//  Created by Salih Özdemir on 17.04.2023.
//

import SwiftUI

enum SortingType {
    case name, recent
}

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var dateAdded = Date()
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    var sortingType: SortingType = .name
    
    init() {
        people = []
        
        if let data = loadFile() {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
    }
    
    private func save() {
        switch sortingType {
        case .name:
            people.sort {
                $0.name < $1.name
            }
        case .recent:
            people.sort {
                $0.dateAdded > $1.dateAdded
            }
        }
        
        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
            
            saveFile(data: encoded)
        }
    }
    
    func add(_ prospect: Prospect) {
        prospect.dateAdded = Date.now
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func changeSorting(to sortingType: SortingType) {
        self.sortingType = sortingType
        save()
    }
    
    private func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func loadFile() -> Data? {
        let url = getDocumentDirectory().appendingPathComponent(saveKey)
        if let data = try? Data(contentsOf: url) {
            return data
        }

        return nil
    }
    
    private func saveFile(data: Data) {
        let url = getDocumentDirectory().appendingPathComponent(saveKey)

        do {
            try data.write(to: url, options: [.atomicWrite, .completeFileProtection])
        }
        catch let error {
            print("Could not write data: " + error.localizedDescription)
        }
    }
}
