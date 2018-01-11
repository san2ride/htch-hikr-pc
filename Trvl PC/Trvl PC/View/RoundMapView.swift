//
//  RoundMapView.swift
//  Trvl PC
//
//  Created by don't touch me on 1/11/18.
//  Copyright © 2018 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit

class RoundMapView: MKMapView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 10.0
    }

}
