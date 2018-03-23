//
//  User.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

class User {
    var name:String?
    var email:String?
    var password:String?
    
    init() { }
    
    init(name:String, email:String) {
        self.name = name
        self.email = email
    }
    
    init(name:String, email:String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
