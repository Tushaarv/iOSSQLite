//
//  EmployeeViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

protocol EmployeeView:BaseView {
    
    func showHomeScreen ()
}

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
    
    var presenter:EmployeePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = EmployeePresenter(view: self)
        
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
        
        // Dont allow to update email in edit mode as it should be unique
        if mode != .edit {
            self.textEmail.isUserInteractionEnabled = value
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSave(_ sender: UIButton) {
        if mode == .view {
            // Update to edit mode based on the value
            mode = .edit
            self.editModeEnabled(true)
        }
        else if mode == .new {
            
            let email:String = (textEmail.text?.trimmingCharacters(in: .whitespaces).lowercased())!
            let name = textName.text!
            self.presenter.addNewEmployee(employee:Employee(name: name, email: email))
        }
        else {
            let name = textName.text!
            self.presenter.updateEmployee(selectedEmployee:self.selectedEmployee!,
                                          updatedData:Employee(name: name, email: ""))
        }
    }
}

extension EmployeeViewController : EmployeeView {
    
    func showError(message: String) {
        Alerts.showError(parentView: self, message: message)
    }
    
    func showHomeScreen () {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_HOME, sender: self)
    }
}
