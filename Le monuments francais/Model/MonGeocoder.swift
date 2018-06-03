//
//  MonGeocoder.swift
//  Le monuments francais
//
//  Created by Benoît Goossens on 3/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import CoreLocation

typealias AdresseCompletion = (_ adresse:String?, _ error:String?) -> (Void)

class MonGeocoder {
    
    static let obtenir = MonGeocoder()
    
    func adresseDepuis(location: CLLocation, completion: AdresseCompletion?) {
        let codeur = CLGeocoder()
        codeur.reverseGeocodeLocation(location) { (placemarks, error) in
            if let err = error {
                completion?(nil, err.localizedDescription)
            } else if let array = placemarks, array.count > 0 {
                let monPositionnement = array.last
                let numero = monPositionnement?.subThoroughfare ?? ""
                let rue = monPositionnement?.thoroughfare ?? ""
                let ville = monPositionnement?.locality ?? ""
                let adresse = numero + " " + rue + ", " + ville
                completion?(adresse, nil)
            } else {
                completion?(nil, "Une erreur est survenue")
            }
        }
    }
}
