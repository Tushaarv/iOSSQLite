//
//  ViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

protocol LoginView: BaseView {
    func showHomeScreen()
    func showSignupScreen()
    func showResetPasswordScreen()
}

class LoginViewController: BaseViewController {
    
    private struct LocalConstants {
        // Storyboard
        static let STORYBOARD_MAIN = "Main"
        static let VIEWCONTROLLER_HOME = "VIEW_HOME"
        
        // Segues
        static let SEGUE_REGISTER:String = "SEGUE_LOGIN_REGISTER"
        static let SEGUE_RESET:String = "SEGUE_LOGIN_RESET"
    }
    
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    var presenter:LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
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
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        let password = textPassword.text!
        let loginUser = User(name: "", email: email, password: password)
        presenter?.verifyLogin(loginUser: loginUser)
    }
    
    @IBAction func unwindToLogin(segue:UIStoryboardSegue) {}
    
}

extension LoginViewController : LoginView {
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: LocalConstants.STORYBOARD_MAIN, bundle: nil)
        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: LocalConstants.VIEWCONTROLLER_HOME)
        UIApplication.shared.keyWindow?.rootViewController = homeNavigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    func showSignupScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_REGISTER, sender: self)
    }
    
    func showResetPasswordScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_RESET, sender: self)
    }
    
    func showError(message: String) {
        Alerts.showError(parentView: self, message: message)
    }
}

