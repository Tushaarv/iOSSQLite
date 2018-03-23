//
//  EmployeeViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class EmployeeViewController: BaseViewController {
    
    enum Mode {
        case new
        case edit
        case view
    }
    
    private struct LocalConstants {
        
        // Segues
        static let SEGUE_HOME:String = "SEGUE_EMPLOYEE_HOME"
        
        static let BUTTON_SAVE_MODE = "Save"
        static let BUTTON_EDIT_MODE = "Edit"
    }
    
    @IBOutlet weak var imageEmployee: UIImageView!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textEmail: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    var mode:Mode! = .new
    var selectedEmployee:Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.selectedEmployee != nil {
            self.textName.text = self.selectedEmployee?.name
            self.textEmail.text = self.selectedEmployee?.email
        }
        
        switch mode {
        case .view:
            self.editModeEnabled(false)
            break
        case .edit:
            self.editModeEnabled(true)
            break
        default:
            self.editModeEnabled(true)
        }
    }
    
    func editModeEnabled(_ value:Bool) {
        self.buttonSave.setTitle(value == true ? LocalConstants.BUTTON_SAVE_MODE : LocalConstants.BUTTON_EDIT_MODE, for: .normal)
        self.textName.isUserInteractionEnabled = value
        
        if mode != .new {
            self.textEmail.isUserInteractionEnabled = value
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSave(_ sender: UIButton) {
        if mode == .view {
            self.editModeEnabled(true)
            mode = .edit
        }
        else if mode == .new {
            addNewEmployee()
        }
        else {
            updateEmployee(employee:self.selectedEmployee!)
        }
    }
    
    func addNewEmployee() {
        
        let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
        let name = textName.text!
        if self.isEmployeeDataValid(name:name, email:email) {
            // Save Employee Details
            let employee:Employee = Employee(name: name, email: email)
            if !self.exployeeExists(employee: employee) {
                Common.employees.append(employee)
                
                self.showHomeScreen()
            }
            else {
                Alerts.showError(parentView: self, message: "Employee Save Failed")
            }
        }
    }
    
    func exployeeExists(employee:Employee) -> Bool {
        return Common.employees.filter{$0.email == employee.email}.count != 0
    }
    
    func updateEmployee(employee: Employee) {
        let name = textName.text!
        if self.isEmployeeDataValid(name:name, email:employee.email!) {
            if self.exployeeExists(employee: employee) {
                // Update Employee Details
                let temp:Employee = Common.employees.filter{$0.email! == employee.email!}.first!
                let index:Int = Common.employees.index{$0 === temp}!
                Common.employees[index].name = name
                
                self.showHomeScreen()
            }
            else {
                Alerts.showError(parentView: self, message: "Employee update Failed")
            }
        }
    }
    
    func isEmployeeDataValid(name:String, email:String) -> Bool {
        if !(name.isValidString()) {
            Alerts.showError(parentView: self, message: "Invalid Name")
            return false
        }
        if !(email.isValidEmail()) {
            Alerts.showError(parentView: self, message: "Invalid Email")
            return false
        }
        return true
    }
    
    func showHomeScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_HOME, sender: self)
    }
}
