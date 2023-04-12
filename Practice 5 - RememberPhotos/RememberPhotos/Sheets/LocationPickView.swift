//
//  LocationPickView.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 12.04.2023.
//

import SwiftUI
import MapKit

struct LocationPickView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion)
                .onAppear {
                    if let savedLocation = LocationFetcher.shared.savedLocation {
                        mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: savedLocation.latitude, longitude: savedLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
                    } else if let lastKnownLocation = LocationFetcher.shared.lastKnownLocation {
                        mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lastKnownLocation.latitude, longitude: lastKnownLocation.longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
                    }
                }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button("Select") {
                        LocationFetcher.shared.savedLocation = CLLocationCoordinate2D(latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
                        
                        dismiss()
                    }
                    .padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
            }
            .padding()
            
            Circle()
                .foregroundColor(.white)
                .frame(width: 18, height: 18)
                .overlay {
                    Circle()
                        .foregroundColor(.blue)
                        .scaleEffect(0.6)
                }
        }
        .ignoresSafeArea()
    }
}

struct LocationPickView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickView()
    }
}
