//
//  LocationManager.swift
//  LabPac1
//
//  Created by Guest1 on 2025-03-26.
//

import Foundation
//core location needed for location services
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    private let locationManager = CLLocationManager()
    var onLocationUpdate:((CLLocation) -> Void)?
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func startUpdating(){
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating(){
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        if let location = locations.last{
            onLocationUpdate?(location)
        }
    }
}
