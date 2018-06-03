//
//  AnnotationView.swift
//  Le monuments francais
//
//  Created by Benoît Goossens on 3/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

class AnnotationView: MKAnnotationView {
    
    override var annotation: MKAnnotation?{
        willSet {
            guard let nouvelle = newValue as? MonAnnotation else {return}
            image = nouvelle.image
        }
    }
}
