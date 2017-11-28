//
//  LoginVC.swift
//  Trvl PC
//
//  Created by don't touch me on 11/21/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindtoKeyboard()
    }

    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
