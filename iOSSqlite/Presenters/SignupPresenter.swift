//
//  SignupPresenter.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

private protocol SignupPresenterProtocol {
    init(view:SignupView)
    func signup(newUser:User)
    func isSignupDataValid(email:String, name:String, password:String) -> Bool
}

class SignupPresenter: SignupPresenterProtocol {
    
    unowned let view:SignupView
    
    required init(view: SignupView) {
        self.view = view
    }
    
    func signup(newUser: User) {
        
        if self.isSignupDataValid(email:newUser.email!, name:newUser.name!, password: newUser.password!) {
            // Signup User
            let signupResult = UserRepository().addUser(user: User(name: newUser.name!,
                                                                   email: newUser.email!,
                                                                   password: newUser.password!))
            if signupResult.success {
                self.view.showHomeScreen()
            }
            else {
                self.view.showError(message: "Signup Failed")
            }
        }
    }
    
    func isSignupDataValid(email: String, name: String, password: String) -> Bool {
        if !(name.isValidString()) {
            self.view.showError(message: "Invalid Name")
            return false
        }
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
