//
//  SignupViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController {
    
    private struct LocalConstants {
        // Storyboard
        static let STORYBOARD_MAIN = "Main"
        static let VIEWCONTROLLER_HOME = "VIEW_HOME"
    }
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSignup(_ sender: UIButton) {
        self.signup()
    }
    
    func signup() {
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        let name:String = (textName.text?.trimmingCharacters(in: .whitespaces))!
        let password = textPassword.text!
        if self.isSignupDataValid(email:email, name:name, password: password) {
            // Signup User
            if email == "tushaarv@gmail.com" && password == "qwerty" {
                self.showHomeScreen()
            }
            else {
                Alerts.showError(parentView: self, message: "Signup Failed")
            }
        }
    }
    
    func isSignupDataValid(email:String, name:String, password:String) -> Bool {
        if !(name.isValidString()) {
            Alerts.showError(parentView: self, message: "Invalid Name")
            return false
        }
        if !(email.isValidEmail()) {
            Alerts.showError(parentView: self, message: "Invalid Email")
            return false
        }
        if !(password.isValidPassword()) {
            Alerts.showError(parentView: self, message: "Invalid Password")
            return false
        }
        return true
    }
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: LocalConstants.STORYBOARD_MAIN, bundle: nil)
        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: LocalConstants.VIEWCONTROLLER_HOME)
        UIApplication.shared.keyWindow?.rootViewController = homeNavigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
