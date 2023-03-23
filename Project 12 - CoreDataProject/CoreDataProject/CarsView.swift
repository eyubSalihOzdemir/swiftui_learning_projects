//
//  CarsView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct CarsView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddSheet = false
    
    var body: some View {
        FilteredList(filterKey: "", filterValue: "") { (car: Car) in
            VStack(alignment: .leading) {
                Text(car.wrappedModel)
                
                Text(car.wrappedBrand)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Your cars")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    showingAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddSheet) {
            AddCarView()
        }
    }
}

struct CarsView_Previews: PreviewProvider {
    static var previews: some View {
        CarsView()
    }
}
