//
//  PassengerAnnotation.swift
//  Trvl PC
//
//  Created by don't touch me on 1/3/18.
//  Copyright © 2018 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit

class PassengerAnnotation: NSObject, MKAnnotation {
    dynamic  var coordinate: CLLocationCoordinate2D
    var key: String
    
    init(coordinate: CLLocationCoordinate2D, key: String) {
        self.coordinate = coordinate
        self.key = key
        super.init()
    }
}
