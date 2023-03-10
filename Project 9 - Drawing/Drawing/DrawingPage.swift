//
//  ContentView.swift
//  Drawing
//
//  Created by Salih Özdemir on 9.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Button("Drawing & Shapes") { }
                    .buttonStyle(.bordered)
                Button("Flower") { }
                    .buttonStyle(.bordered)
                Button("Colors") { }
                    .buttonStyle(.bordered)
            }
        }
    }
}

struct DrawingPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
