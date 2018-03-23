//
//  SignupViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

protocol SignupView: BaseView {
    func showHomeScreen()
}

class SignupViewController: BaseViewController {
    
    private struct LocalConstants {
        // Storyboard
        static let STORYBOARD_MAIN = "Main"
        static let VIEWCONTROLLER_HOME = "VIEW_HOME"
    }
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    var presenter:SignupPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignupPresenter(view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSignup(_ sender: UIButton) {
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        let name:String = (textName.text?.trimmingCharacters(in: .whitespaces))!
        let password = textPassword.text!
        self.presenter.signup(newUser: User(name: name, email: email, password: password))
    }
}

extension SignupViewController : SignupView {
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: LocalConstants.STORYBOARD_MAIN, bundle: nil)
        let homeNavigationController = storyboard.instantiateViewController(withIdentifier: LocalConstants.VIEWCONTROLLER_HOME)
        UIApplication.shared.keyWindow?.rootViewController = homeNavigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    func showError(message: String) {
        Alerts.showError(parentView: self, message: "Invalid Password")
    }
}
