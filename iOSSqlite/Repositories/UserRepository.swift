//
//  UserRepository.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

class UserRepository {
    
    func users()-> [User] {
        return Common.users
    }
    
    func userByEmail(email:String) -> User {
        return Common.users.filter{$0.email! == email}.first!
    }
    
    func validateLogin(email:String, password:String) -> (success:Bool, user:User?) {
        
        let result = Common.users.filter{$0.email! == email && $0.password! == password}
        return (success:result.count != 0, user: result.count == 0 ? nil : result.first!)
    }
    
    func userExists(user:User) -> Bool {
        return Common.users.filter{$0.email == user.email}.count != 0
    }
    
    func addUser(user:User) -> Bool {
        if !self.userExists(user: user) {
            Common.users.append(user)
            return true
        }
        else {
            return false
        }
    }
    
    func updateUser(user:User) -> Bool {
        if self.userExists(user: user) {
            let temp:User = Common.users.filter{$0.email! == user.email!}.first!
            let index:Int = Common.users.index{$0 === temp}!
            Common.users[index].name = user.name
            return true
        }
        else {
            return false
        }
    }
}
