//
//  MonAnnotation.swift
//  Le monuments francais
//
//  Created by Benoît Goossens on 3/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

class MonAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    let image = #imageLiteral(resourceName: "Group")
    
    init(titre: String, adresse: String, coordonnees: CLLocationCoordinate2D) {
        self.title = titre
        self.subtitle = adresse
        self.coordinate = coordonnees
        super.init()
    }
}
