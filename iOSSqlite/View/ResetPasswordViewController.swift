//
//  ResetPasswordViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

protocol ResetPasswordView: BaseView {
    func showLoginScreen()
}

class ResetPasswordViewController: BaseViewController {
    
    private struct LocalConstants {
        
        // Segues
        static let SEGUE_LOGIN:String = "SEGUE_RESET_LOGIN"
    }

    @IBOutlet weak var textEmail: UITextField!
    
    var presenter:ResetPasswordPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ResetPasswordPresenter(view: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickResetPassword(_ sender: UIButton) {
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        self.presenter.resetPassword(loginUser:User(name: "", email: email))
    }
    
    func showLoginScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_LOGIN, sender: self)
    }
}

extension ResetPasswordViewController : ResetPasswordView {
    func showError(message: String) {
        Alerts.showError(parentView: self, message: "Invalid Password")
    }
}
