//
//  UIViewExt.swift
//  Trvl PC
//
//  Created by don't touch me on 11/21/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}
