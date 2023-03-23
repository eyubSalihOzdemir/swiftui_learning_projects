//
//  SongsView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct SongsView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddSheet = false
    
    var body: some View {
        FilteredList(filterKey: "", filterValue: "") { (song: Song) in
            VStack(alignment: .leading) {
                Text(song.wrappedName)
                
                Text(song.wrappedArtist)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Your songs")
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
            AddSongView()
        }
    }
}

struct SongsView_Previews: PreviewProvider {
    static var previews: some View {
        SongsView()
    }
}
