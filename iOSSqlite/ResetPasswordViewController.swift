//
//  ResetPasswordViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class ResetPasswordViewController: BaseViewController {
    
    private struct LocalConstants {
        
        // Segues
        static let SEGUE_LOGIN:String = "SEGUE_RESET_LOGIN"
    }

    @IBOutlet weak var textEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickResetPassword(_ sender: UIButton) {
        self.resetPassword()
    }
    
    func showLoginScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_LOGIN, sender: self)
    }
    
    func resetPassword() {
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        if self.isResetDataValid(email:email) {
            // Request Password Reset
            if email == "tushaarv@gmail.com" {
                self.showLoginScreen()
            }
            else {
                Alerts.showError(parentView: self, message: "Password Reset Failed")
            }
        }
    }
    
    func isResetDataValid(email:String) -> Bool {
        if !(email.isValidEmail()) {
            Alerts.showError(parentView: self, message: "Invalid Email")
            return false
        }
        return true
    }
}
