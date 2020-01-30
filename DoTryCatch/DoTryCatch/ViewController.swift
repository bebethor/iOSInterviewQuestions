//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Sean Allen on 8/30/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLenth
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func login() throws {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLenth
        }
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        do {
//            let imageData = try Data(contentsOf: URL(fileURLWithPath: "myFilePath"))
//            // Do whatever you need to do with imageData
//        } catch {
//            // Handle the error
//            // show pop up with error
//            print(error.localizedDescription)
//
//        }
        do {
           try login()
        } catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.invalidEmail {
            Alert.showBasic(title: "Invalid Email", message: "Please check your email format", vc: self)
        } catch LoginError.incorrectPasswordLenth {
            Alert.showBasic(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch {
            Alert.showBasic(title: "Unable to Login", message: "\(error.localizedDescription)", vc: self)
        }
    }
}
