//
//  Activities.swift
//  KeepTrack
//
//  Created by Salih Özdemir on 11.03.2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encodedItems = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decodedItems = try? decoder.decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = [
            ActivityItem(name: "Cycling", description: "Casual cycling in the city.", count: 0),
            ActivityItem(name: "Reading", description: "Reading at least 20 pages at one session.", count: 0),
            ActivityItem(name: "Researching", description: "Making research about some topic for at least 20 minutes.", count: 0),
            ActivityItem(name: "Swimming", description: "Swimming for at least half an hour.", count: 0),
            ActivityItem(name: "Walking", description: "Taking a walk for at least half an hour.", count: 0)
        ]
    }
}
