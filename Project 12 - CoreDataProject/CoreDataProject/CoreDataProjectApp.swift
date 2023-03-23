//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
