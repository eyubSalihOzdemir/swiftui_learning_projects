//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Salih Özdemir on 30.04.2023.
//

import SwiftUI

enum SortType {
    case none, name, country
}

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    
    @State private var sortType: SortType = .none
    
    @StateObject var favorites = Favorites()
    
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 0.5)
                            )
                        
                        VStack(alignment: .leading) {
                            Text("\(resort.name)")
                                .font(.headline)
                            
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem {
                    Button {
                        switch sortType {
                        case .none:
                            sortType = .name
                        case .name:
                            sortType = .country
                        case .country:
                            sortType = .none
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease")
                    }
                }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
        /// if you want to have stack navigation view style (show primary view directly) no matter the size of the phone
        //.phoneOnlyNavigationView()
    }
    
    var sortedResorts: [Resort] {
        switch sortType {
        case .none:
            return filteredResorts
        case .name:
            return filteredResorts.sorted {
                $0.name < $1.name
            }
        case .country:
            return filteredResorts.sorted {
                $0.country < $1.country
            }
        }
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
