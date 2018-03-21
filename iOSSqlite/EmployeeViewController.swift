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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickSave(_ sender: UIButton) {
        
    }
}
