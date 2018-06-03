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
    
    let urlString = "https://www.data.gouv.fr/s/resources/monuments-historiques-francais/20150408-163911/monuments.json"
    var location = CLLocationManager()
    var monuments = [Monument]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carteMap.showsUserLocation = true
        miseEnPlace()
        obtenirDonneesDesMonuments()
    }

    func obtenirDonneesDesMonuments() {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {return}
            do {
                self.monuments = try JSONDecoder().decode([Monument].self, from: data!)
                DispatchQueue.main.async {
                    self.insererAnnotations()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func insererAnnotations() {
        for monument in self.monuments {
            if let latitudeString = monument.latitude, let longitudeString = monument.longitude {
                if let latitude = Double(latitudeString), let longitude = Double(longitudeString) {
                    let coordonnee = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    let titre = monument.name ?? ""
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    MonGeocoder.obtenir.adresseDepuis(location: location) { (adresse, err) -> (Void) in
                        var adresseMonument = ""
                        if adresse != nil {
                            adresseMonument = adresse!
                        }
                        let monAnnotation = MonAnnotation(titre: titre, adresse: adresseMonument, coordonnees: coordonnee)
                        self.carteMap.addAnnotation(monAnnotation)
                    }
                }
            }
        }
    }
    
    @IBAction func meLocaliserButton_onClick(_ sender: Any) {
        location.requestAlwaysAuthorization()
        location.startUpdatingLocation()
    }
    
    @IBAction func segmentCtrl_onClick(_ sender: Any) {
        switch segmentCtrl.selectedSegmentIndex {
        case 0: carteMap.mapType = .standard
        case 1: carteMap.mapType = .satellite
        case 2: carteMap.mapType = .hybrid
        default:
            break
        }
    }
    
}
