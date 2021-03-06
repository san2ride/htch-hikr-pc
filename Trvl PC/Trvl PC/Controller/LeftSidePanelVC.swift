//
//  LeftSidePanelVC.swift
//  Trvl PC
//
//  Created by don't touch me on 11/20/17.
//  Copyright © 2017 trvl, LLC. All rights reserved.
//

import UIKit
import Firebase

class LeftSidePanelVC: UIViewController {
    
    let appDelegate = AppDelegate.getAppDelegate()
    
    let currentUserId = Auth.auth().currentUser?.uid
    
    @IBOutlet var userEmailLabel: UILabel!
    @IBOutlet var userAccountTypeLabel: UILabel!
    @IBOutlet var userImageView: RoundImageView!
    @IBOutlet var loginOutButton: RoundedShadowButton!
    @IBOutlet var pickupModeSwitch: UISwitch!
    @IBOutlet var pickupModeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickupModeSwitch.isOn = false
        pickupModeSwitch.isHidden = true
        pickupModeLabel.isHidden = true
        
        observePassengersAndDrivers()
        
        if Auth.auth().currentUser == nil {
            userEmailLabel.text = ""
            userAccountTypeLabel.text = ""
            userImageView.isHidden = true
            loginOutButton.setTitle(MSG_SIGN_UP_SIGN_IN, for: .normal)
        } else {
            userEmailLabel.text = Auth.auth().currentUser?.email
            userAccountTypeLabel.text = ""
            userImageView.isHidden = false
            loginOutButton.setTitle(MSG_SIGN_OUT, for: .normal)
        }
    }
    
    func observePassengersAndDrivers() {
        DataService.instance.REF_USERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.userAccountTypeLabel.text = ACCOUNT_TYPE_PASSENGER
                    }
                }
            }
        })
        DataService.instance.REF_DRIVERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.userAccountTypeLabel.text = ACCOUNT_TYPE_DRIVER
                        self.pickupModeSwitch.isHidden = false
                        
                        let switchStatus = snap.childSnapshot(forPath: ACCOUNT_PICKUP_MODE_ENABLED).value as! Bool
                        self.pickupModeSwitch.isOn = switchStatus
                        self.pickupModeLabel.isHidden = false
                    }
                }
            }
        })
    }
    
    @IBAction func switchToggled(_ sender: Any) {
        if pickupModeSwitch.isOn {
            pickupModeLabel.text = MSG_PICKUP_MODE_ENABLED
            appDelegate.MenuContainerVC.toggleLeftPanel()
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues([ACCOUNT_PICKUP_MODE_ENABLED: true])
        } else {
            pickupModeLabel.text = MSG_PICKUP_MODE_ENABLED
            appDelegate.MenuContainerVC.toggleLeftPanel()
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues([ACCOUNT_PICKUP_MODE_ENABLED: false])
        }
    }
    
    @IBAction func signUpLoginButtonPressed(_ sender: UIButton) {
        if Auth.auth().currentUser == nil {
        let storyBoard = UIStoryboard(name: MAIN_STORYBOARD, bundle: Bundle.main)
        let loginVC = storyBoard.instantiateViewController(withIdentifier:  VC_LOGIN) as? LoginVC
        present(loginVC!, animated: true, completion: nil)
        } else {
            do {
                try Auth.auth().signOut()
                userEmailLabel.text = ""
                userAccountTypeLabel.text = ""
                userImageView.isHidden = true
                pickupModeLabel.text = ""
                pickupModeSwitch.isHidden = true
                loginOutButton.setTitle(MSG_SIGN_UP_SIGN_IN, for: .normal)
            } catch (let error) {
                print(error)
            }
        }
    }
}
