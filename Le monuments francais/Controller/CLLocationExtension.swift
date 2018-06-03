//
//  CLLocationExtension.swift
//  Le monuments francais
//
//  Created by Benoît Goossens on 3/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

extension CarteController: CLLocationManagerDelegate {
    
    func miseEnPlace() {
        location.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            location.stopUpdatingLocation()
            let maPosition = locations[0]
            let coordonnees = maPosition.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordonnees, span: span)
            carteMap.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

