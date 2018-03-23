//
//  LoginPresenter.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

private protocol LoginPresenterProtocol {
    init(view:LoginView)
    func verifyLogin(loginUser:User)
}

class LoginPresenter: LoginPresenterProtocol {
    unowned let view:LoginView
    
    required init(view:LoginView) {
        self.view = view
    }
    
    func verifyLogin(loginUser:User) {
        if self.isLoginDataValid(email:loginUser.email!, password: loginUser.password!) {
            // Equate Login Details
            if loginUser.email! == "tushaarv@gmail.com" && loginUser.password! == "qwerty" {
                self.view.showHomeScreen()
            }
            else {
                self.view.showError(message: "Authentication Failed")
            }
        }
    }
    
    func isLoginDataValid(email:String, password:String) -> Bool {
        if !(email.isValidEmail()) {
            self.view.showError(message: "Invalid Email")
            return false
        }
        if !(password.isValidPassword()) {
            self.view.showError(message: "Invalid Password")
            return false
        }
        return true
    }
}
