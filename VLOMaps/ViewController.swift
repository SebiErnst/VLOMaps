//
//  ViewController.swift
//  VLOMaps
//
//  Created by Prowadzący on 14/12/16.
//  Copyright © 2016 KIS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var myMapView: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMapView.delegate = self
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }

    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("Will start loading map")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("Region did change")
        print(mapView.region)
        print(mapView.visibleMapRect)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        myMapView.setCenter(newLocation.coordinate, animated: true)
    }


}

