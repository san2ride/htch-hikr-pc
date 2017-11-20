//
//  RequestRideController.swift
//  Trvl PC
//
//  Created by don't touch me on 11/19/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit

class RequestRideController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    

    

}
