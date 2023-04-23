//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Salih Özdemir on 23.04.2023.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .opacity(Double(geo.frame(in: .global).minY / 200))
                            .scaleEffect(Double(geo.frame(in: .global).maxY / fullView.size.height) <= 0.5 ? 0.5 : Double(geo.frame(in: .global).maxY / fullView.size.height))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
