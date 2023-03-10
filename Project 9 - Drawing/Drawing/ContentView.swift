//
//  ContentView.swift
//  Drawing
//
//  Created by Salih Özdemir on 9.03.2023.
//

import SwiftUI

struct CardView: View {
    var image: String
    var heading: String
    var author: String
    
    let cornerRadius = 10.0
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .clipped()
         
            HStack {
                VStack(alignment: .leading) {
                    Text(heading)
                        .font(.title)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                //.layoutPriority(200)

                Spacer()
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 2)
        )
        .padding([.top, .horizontal])
        
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    DrawingView()
                        .navigationTitle("Drawing Paths & Shapes")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    CardView(image: "shapes", heading: "Drawing Paths & Shapes", author: "paths")
                }
                
                NavigationLink {
                    FlowerView()
                        .navigationTitle("Dynamic Flower")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    CardView(image: "flower", heading: "Dynamic Flower", author: "cgaffinetransform")
                }
                
                NavigationLink {
                    ColorsView()
                        .navigationTitle("Color Hues")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    CardView(image: "colors", heading: "Color Hues", author: "core animation and metal")
                }
                
                NavigationLink {
                    ColorBlendView()
                        .navigationTitle("Color Blend")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    CardView(image: "colorBlend", heading: "Color Blend", author: "blend modes")
                }
                
                NavigationLink {
                    AnimationView()
                        .navigationTitle("Animation")
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    CardView(image: "animation", heading: "Animation", author: "animetabledata")
                }
            }
            .navigationTitle("Drawing Project Pages")
            .background(.gray.opacity(0.2))
        }
        
        
    }
    
    init() {
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
