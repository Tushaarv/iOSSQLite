//
//  EmployeeViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {
    
    enum Mode {
        case new
        case edit
        case view
    }
    
    private struct LocalConstants {
        
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
        self.buttonSave.setTitle(value == true ? "Save" : "Edit", for: .normal)
        self.textName.isUserInteractionEnabled = value
        self.textEmail.isUserInteractionEnabled = value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSave(_ sender: UIButton) {
        if mode == .view {
            self.editModeEnabled(true)
        }
        else {
            
        }
    }
}
