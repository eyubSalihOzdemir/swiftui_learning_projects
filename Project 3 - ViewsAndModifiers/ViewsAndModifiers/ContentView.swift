//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Salih Özdemir on 2.03.2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
}

struct ContentView: View {
    
    var body: some View {
        Text("Hello, world!")
            .modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
