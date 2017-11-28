//
//  LeftSidePanelVC.swift
//  Trvl PC
//
//  Created by don't touch me on 11/20/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signUpLoginButtonPressed(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let loginVC = storyBoard.instantiateViewController(withIdentifier:  "LoginVC") as? LoginVC
        
        present(loginVC!, animated: true, completion: nil)
    }
}
