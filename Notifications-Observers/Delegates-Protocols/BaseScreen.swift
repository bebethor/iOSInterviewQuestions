//
//  BaseScreen.swift
//  Delegates-Protocols
//
//  Created by Sean Allen on 5/20/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit

let lightNotificationKey = "co.seanallen.lightSide"
let darkNotificationKey = "co.seanallen.darkSide"

class BaseScreen: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createObservers() {
        
    }
    
    @objc func updateCharacterImage(notification: NSNotification) {
        
    }
    
    @objc func updateNameLabel(notification: NSNotification) {
        
    }
    
    @objc func updateBackground(notification: NSNotification) {
        
    }
    
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        
    }
}
