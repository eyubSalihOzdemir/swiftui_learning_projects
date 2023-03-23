//
//  MoviesView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct MoviesView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddSheet = false
    
    var body: some View {
        FilteredList(filterKey: "", filterValue: "") { (movie: Movie) in
            VStack(alignment: .leading) {
                HStack {
                    Text(movie.wrappedName)
                    
                    Spacer()
                    
                    Text(movie.releaseDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
                }
                
                Text(movie.wrappedDirector)
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Your movies")
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
            AddMovieView()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
