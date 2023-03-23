//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        SongsView()
                    } label: {
                        Text("Songs")
                    }
                    
                    NavigationLink {
                        CarsView()
                    } label: {
                        Text("Cars")
                    }
                    
                    NavigationLink {
                        MoviesView()
                    } label: {
                        Text("Movies")
                    }
                    
                    Section {
                        NavigationLink {
                            CandiesCountriesView()
                        } label: {
                            Text("Candies & Countries")
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Your lists")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
