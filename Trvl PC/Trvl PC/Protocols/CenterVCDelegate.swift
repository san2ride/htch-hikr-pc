//
//  CenterVCDelegate.swift
//  Trvl PC
//
//  Created by don't touch me on 11/20/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
