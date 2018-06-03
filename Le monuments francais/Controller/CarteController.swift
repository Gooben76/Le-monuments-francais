//
//  CarteController.swift
//  Le monuments francais
//
//  Created by Benoît Goossens on 3/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import MapKit

class CarteController: UIViewController {

    @IBOutlet weak var carteMap: MKMapView!
    @IBOutlet weak var meLocaliserButton: UIButton!
    @IBOutlet weak var segmentCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func meLocaliserButton_onClick(_ sender: Any) {
    }
    
    @IBOutlet weak var segmentCtrl_onClick: UISegmentedControl!
    
}
