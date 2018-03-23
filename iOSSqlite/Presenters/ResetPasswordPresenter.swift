//
//  ResetPasswordPresenter.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

private protocol ResetPasswordPresenterProtocol {
    init(view:ResetPasswordView)
}

class ResetPasswordPresenter: ResetPasswordPresenterProtocol {
    unowned let view:ResetPasswordView
    
    required init(view:ResetPasswordView) {
        self.view = view
    }
    
    func resetPassword(loginUser:User) {
        if self.isResetDataValid(email:loginUser.email!) {
            // Request Password Reset
            if loginUser.email! == "tushaarv@gmail.com" {
                self.view.showLoginScreen()
            }
            else {
                self.view.showError(message: "Password Reset Failed")
            }
        }
    }
    
    func isResetDataValid(email:String) -> Bool {
        if !(email.isValidEmail()) {
            self.view.showError(message: "Invalid Email")
            return false
        }
        return true
    }
}
