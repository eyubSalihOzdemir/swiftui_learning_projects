//
//  AddSongView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct AddSongView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var artist = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of the song", text: $name)
                TextField("Artist", text: $artist)
                
                Section {
                    Button("Save") {
                        let newSong = Song(context: moc)
                        newSong.name = name
                        newSong.artist = artist
                        
                        do {
                            try moc.save()
                        } catch {
                            print("Could not save new song")
                        }
                        
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add a new song")
            .toolbar {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
}

//struct AddSongView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddSongView()
//    }
//}
