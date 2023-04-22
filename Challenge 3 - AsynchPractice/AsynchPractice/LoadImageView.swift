//
//  LoadImageView.swift
//  CupcakeCorner
//
//  Created by Salih Özdemir on 15.03.2023.
//

import SwiftUI

struct LoadImageView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("Good URL")
                    .font(.headline)
                
                AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
            }
            Spacer()
            
            Divider()
                .padding(.horizontal)
            
            Spacer()
            VStack(spacing: 10) {
                Text("Bad URL")
                    .font(.headline)
                
                AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 200)
            }
            Spacer()
        }
    }
}

struct LoadImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadImageView()
    }
}
