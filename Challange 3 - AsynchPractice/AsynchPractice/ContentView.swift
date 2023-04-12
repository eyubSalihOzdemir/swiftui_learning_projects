//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Salih Özdemir on 12.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    FetchDataView()
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Fetch data using API")
                        Text("Using JSON and Codable property")
                            .font(.footnote)
                    }
                }
                
                NavigationLink {
                    LoadImageView()
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Load image from the web")
                        Text("Using async-await keywords")
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("AsynchPractice")
        }
    }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
