//
//  EmployeeRepository.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

class EmployeeRepository {
    
    func employees()-> [Employee] {
        return Common.employees
    }
    
    func employeeByEmail(email:String)-> Employee {
        return Common.employees.filter{$0.email! == email}.first!
    }
    
    func employeeExists(employee:Employee) -> Bool {
        return Common.employees.filter{$0.email == employee.email}.count != 0
    }
    
    func addEmployee(employee:Employee) -> Bool {
        if !self.employeeExists(employee: employee) {
            Common.employees.append(employee)
            return true
        }
        else {
            return false
        }
    }
    
    func updateEmployee(employee:Employee) -> Bool {
        if self.employeeExists(employee: employee) {
            let temp:Employee = Common.employees.filter{$0.email! == employee.email!}.first!
            let index:Int = Common.employees.index{$0 === temp}!
            Common.employees[index].name = employee.name
            return true
        }
        else {
            return false
        }
    }
}
