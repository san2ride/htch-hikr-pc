//
//  HomeVC.swift
//  Trvl PC
//
//  Created by don't touch me on 11/19/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var actionButton: RoundedShadowButton!
    
    var delegate: CenterVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true, withMessage: "")
    }
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        delegate?.toggleLeftPanel()
    }
}
