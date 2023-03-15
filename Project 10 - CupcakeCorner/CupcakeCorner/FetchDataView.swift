//
//  FetchDataView.swift
//  CupcakeCorner
//
//  Created by Salih Özdemir on 15.03.2023.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var trackViewUrl: String
    var artworkUrl60: String
}

struct FetchDataView: View {
    @Environment(\.openURL) var openURL

    
    @State private var results = [Result]()
    
    @State private var name = ""
    var buttonDisabled: Bool {
        return name.isEmpty
    }
    
    var body: some View {
        VStack {
            List {
                Section {
                    TextField("Artist or song name", text: $name)
                }
                
                Section {
                    Button("Search", action: {
                        Task {
                            await loadData(for: name)
                        }
                    })
                    .disabled(buttonDisabled)
                }
                
                ForEach(results, id: \.trackId) { item in
                    HStack(spacing: 20) {
                        AsyncImage(url: URL(string: item.artworkUrl60)) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFit()
                            } else if phase.error != nil {
                                EmptyView()
                            } else {
                                ProgressView()
                            }
                        }
                        .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(item.trackName)
                                .font(.headline)
                            Text(item.collectionName)
                        }
                    }
                    .onTapGesture {
                        openURL(URL(string: item.trackViewUrl)!)
                    }
                }
    //            .task {
    //                await loadData()
    //            }
                .navigationTitle("Fetch data using API")
            }
            
            
        }
        
    }
    
    func loadData(for name: String) async {
        let formattedName = name
            .folding(options: .diacriticInsensitive, locale: Locale(identifier: "en"))
            .lowercased()
            .replacingOccurrences(of: " ", with: "+")
            
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(formattedName)&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let string = String(data: data, encoding: .utf8) {
                print(string)
            }
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                withAnimation {
                    results = decodedResponse.results
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct FetchDataView_Previews: PreviewProvider {
    static var previews: some View {
        FetchDataView()
    }
}
