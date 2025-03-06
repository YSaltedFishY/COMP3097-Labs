//
//  ViewController.swift
//  LocationApp
//
//  Created by Tech on 2025-03-06.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var map: MKMapView!
    
    
    @IBAction func startLocation(_ sender: Any) {
        checkAndStartLocation()
    }
    
    
    @IBAction func stopLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func checkAndStartLocation(){
        switch locationManager.authorizationStatus{
        case .authorizedAlways:
            print("Always authorization granted")
            //            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            print("When in use authorization granted")
//            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Sorry, no authorization")
        default:
            print("Not known, let's ask!")
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAndStartLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first{
            print(locations)
            
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            
            map.setRegion(region, animated: true)
        } else {
            return
        }
    }
    
    
    
}

