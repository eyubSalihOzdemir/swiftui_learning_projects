//
//  LocationFetcher.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 12.04.2023.
//

import Foundation
import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate, ObservableObject {
    static let shared = LocationFetcher() // Singleton instance
    private let manager = CLLocationManager()
    var savedLocation: CLLocationCoordinate2D?
    var lastKnownLocation: CLLocationCoordinate2D?

    private override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
