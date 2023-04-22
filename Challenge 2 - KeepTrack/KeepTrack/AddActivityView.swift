//
//  AddActivityView.swift
//  KeepTrack
//
//  Created by Salih Özdemir on 11.03.2023.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activites = Activities()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var newActivityName = ""
    @State private var newDescription = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section("Activity Name") {
                        TextField("E.g. Drawing", text: $newActivityName)
                    }
                    
                    Section("Activity Description") {
                        TextField("E.g. Practicing my drawing skills", text: $newDescription)
                    }
                }
                .listStyle(.insetGrouped)
                
                Button("Submit") {
                    let item = ActivityItem(name: newActivityName, description: newDescription, count: 0)
                    activites.items.append(item)
                    
                    dismiss()
                }
            }
            .navigationTitle("Add New Activity")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}
