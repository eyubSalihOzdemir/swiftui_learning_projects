//
//  ContentView.swift
//  BucketList
//
//  Created by Salih Özdemir on 5.04.2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isUnlocked {
                    Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            VStack {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(Circle())
                                
                                Text(location.name)
                                    .fixedSize()
                            }
                            .onTapGesture {
                                viewModel.selectedPlace = location
                            }
                        }
                    }
                    .ignoresSafeArea()
                    Circle()
                        .fill(.blue)
                        .frame(width: 32, height: 32)
                        .opacity(0.3)
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                viewModel.addLocation()
                            } label: {
                                Image(systemName: "plus")
                                    .padding()
                                    .background(.black.opacity(0.75))
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                            .alert(viewModel.alertTitle, isPresented: $viewModel.showingAlert) {
                                Button("OK") { }
                            } message: {
                                Text(viewModel.alertMessage)
                            }
                            
                        }
                    }
                } else {
                    Button("Unlock Places") {
                        viewModel.authenticate()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.updateLocation(location: newLocation)
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
