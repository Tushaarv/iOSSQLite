//
//  Alerts.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation
import UIKit

class Alerts {
    
    static func showError(parentView:UIViewController, message:String) {
        self.showAlert(parentView: parentView, title: "Error", message: message)
    }
    
    static func showInfo(parentView:UIViewController, message:String) {
        self.showAlert(parentView: parentView, title: "Info", message: message)
    }
    
    static func showAlert(parentView:UIViewController, title:String, message:String) {
        let alert =  UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let alertActionOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(alertActionOk)
        parentView.present(alert, animated: false, completion: nil)
    }
}
