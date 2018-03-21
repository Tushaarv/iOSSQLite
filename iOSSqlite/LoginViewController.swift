//
//  ViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private struct LocalConstants {
        // Segues
        static let SEGUE_REGISTER:String = "SEGUE_LOGIN_REGISTER"
        static let SEGUE_RESET:String = "SEGUE_LOGIN_RESET"
    }
    
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickResetPassword(_ sender: UIButton) {
        self.showResetPasswordScreen()
    }
    
    @IBAction func didClickRegister(_ sender: UIButton) {
        self.showSignupScreen()
    }
    
    @IBAction func didClickLogin(_ sender: UIButton) {
        self.showHomeScreen()
    }
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: "VIEW_HOME")
        UIApplication.shared.keyWindow?.rootViewController = homeNavigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    func showSignupScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_REGISTER, sender: self)
    }
    
    func showResetPasswordScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_RESET, sender: self)
    }
}

