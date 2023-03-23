//
//  AddMovieView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var director = ""
    @State private var releaseDate: Date = Date.now
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of the movie", text: $name)
                TextField("Director", text: $director)
                DatePicker("Release date", selection: $releaseDate, displayedComponents: .date)
                
                Section {
                    Button("Save") {
                        let newMovie = Movie(context: moc)
                        newMovie.name = name
                        newMovie.director = director
                        newMovie.releaseDate = releaseDate
                        
                        do {
                            try moc.save()
                        } catch {
                            print("Could not save new song")
                        }
                        
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add a new movie")
            .toolbar {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
}
