//
//  AddCarView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct AddCarView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var model = ""
    @State private var brand = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Model of the car", text: $model)
                TextField("Brand", text: $brand)
                
                Section {
                    Button("Save") {
                        let newCar = Car(context: moc)
                        newCar.model = model
                        newCar.brand = brand
                        
                        do {
                            try moc.save()
                        } catch {
                            print("Could not save new song")
                        }
                        
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add a new car")
            .toolbar {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
}
