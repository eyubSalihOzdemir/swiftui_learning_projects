//
//  UsersApp.swift
//  Users
//
//  Created by Salih Özdemir on 23.03.2023.
//

import SwiftUI

@main
struct UsersApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
