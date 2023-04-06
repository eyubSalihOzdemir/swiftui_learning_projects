//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Salih Özdemir on 6.04.2023.
//

import Foundation
import MapKit
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published private(set) var locations: [Location]
        @Published var selectedPlace: Location?
        
        @Published var isUnlocked = false
        
        @Published var showingAlert = false
        @Published var alertTitle = ""
        @Published var alertMessage = ""
        
        let savePath = FileManager.documentsDirectory.appendingPathExtension("SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
            
            save()
        }
        
        func updateLocation(location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
            
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success {
                        Task { @MainActor in
                            self.isUnlocked = true
                        }
                    } else {
                        // authentication error
                        Task { @MainActor in
                            self.alertTitle = "Authentication Error"
                            self.alertMessage = "Error occured while trying to authenticate."
                            self.showingAlert = true
                        }
                    }
                }
            } else {
                // no biometrics
                Task { @MainActor in
                    self.alertTitle = "No Biometrics"
                    self.alertMessage = "You do not have any biometrics on this device. Showing data without authentication."
                    self.showingAlert = true
                    
                    self.isUnlocked = true
                }
            }
        }
    }
}
