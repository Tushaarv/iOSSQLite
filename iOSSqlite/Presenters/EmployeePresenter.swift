//
//  EmployeePresenter.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

private protocol EmployeePresenterProtocol {
    init(view:EmployeeView)
}

class EmployeePresenter: EmployeePresenterProtocol {
    unowned let view: EmployeeView
    
    required init(view: EmployeeView) {
        self.view = view
    }
    
    func exployeeExists(employee:Employee) -> Bool {
        return Common.employees.filter{$0.email == employee.email}.count != 0
    }
    
    func addNewEmployee(employee:Employee) {
        if self.isEmployeeDataValid(name:employee.name!, email:employee.email!) {
            // Save Employee Details
            let employee:Employee = Employee(name: employee.name!, email: employee.email!)
            if !self.exployeeExists(employee: employee) {
                Common.employees.append(employee)
                
                self.view.showHomeScreen()
            }
            else {
                self.view.showError(message: "Employee Save Failed")
            }
        }
    }
    
    func updateEmployee(selectedEmployee: Employee, updatedData:Employee) {
        if self.isEmployeeDataValid(name:updatedData.name!, email:selectedEmployee.email!) {
            if self.exployeeExists(employee: selectedEmployee) {
                // Update Employee Details
                let temp:Employee = Common.employees.filter{$0.email! == selectedEmployee.email!}.first!
                let index:Int = Common.employees.index{$0 === temp}!
                Common.employees[index].name = updatedData.name
                
                self.view.showHomeScreen()
            }
            else {
                self.view.showError(message: "Employee update Failed")
            }
        }
    }
    
    func isEmployeeDataValid(name:String, email:String) -> Bool {
        if !(name.isValidString()) {
            self.view.showError(message: "Invalid Name")
            return false
        }
        if !(email.isValidEmail()) {
            self.view.showError(message: "Invalid Email")
            return false
        }
        return true
    }
}
