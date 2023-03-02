//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Salih Özdemir on 2.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Interseting Button") {
            // do nothing
        }
        .frame(width: 100, height: 100)
        .background(.red)
        .frame(width: 200, height: 200)
        .background(.green)
        .frame(width: 300, height: 300)
        .background(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
