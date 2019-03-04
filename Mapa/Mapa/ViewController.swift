//
//  ViewController.swift
//  Mapa
//
//  Created by Ayax Alexis Casarrubias Rodríguez on 3/4/19.
//  Copyright © 2019 Ayax Alexis. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate {

    
    @IBOutlet weak var Mapa: MKMapView!
      private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        Mapa.mapType = MKMapType.standard
        //Mapa.mapType = MKMapType.hybrid
        let
        cl = CLLocationCoordinate2DMake(19.3111992,-99.1481752)
        
        let delta = CLLocationDegrees(0.01)
        let
        span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        Mapa.region = MKCoordinateRegion(center: cl, span: span)
        let casa = MKPointAnnotation()
        casa.coordinate = cl
        casa.title = "Casa Ayax"
        casa.subtitle = "México, Ciudad de Mexico"
        Mapa.addAnnotation(casa)
        Mapa.showsTraffic = true
        Mapa.showsCompass = true
        Mapa.isZoomEnabled = true
        Mapa.showsScale = true
        
    }
    
}
