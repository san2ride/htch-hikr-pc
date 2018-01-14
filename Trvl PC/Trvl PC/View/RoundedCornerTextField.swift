//
//  RoundedCornerTextField.swift
//  Trvl PC
//
//  Created by don't touch me on 11/23/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {

    var textRectOffSet: CGFloat = 3.5
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    
    
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 16.5 + textRectOffSet, y: 0 + (textRectOffSet / 2), width: self.frame.width - textRectOffSet, height: self.frame.height + textRectOffSet)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return CGRect(x: 16.5 + textRectOffSet, y: 0 + (textRectOffSet / 2), width: self.frame.width - textRectOffSet, height: self.frame.height + textRectOffSet)
//    }
}

//return CGRect(x: 0 + textRectOffSet, y: 0 + (textRectOffSet / 2), width: self.frame.width + textRectOffSet, height: self.frame.height - textRectOffSet)

