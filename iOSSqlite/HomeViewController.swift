//
//  HomeViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private struct LocalConstants {
        
        // Segues
        static let SEGUE_HOME_EMPLOYEE:String = "SEGUE_HOME_EMPLOYEE"
        
        // For Table
        static let EMPLOYEE_SECTIONS:Int = 1
        static let CELL_EMPLOYEE = "CELL_EMPLOYEE"
    }

    @IBOutlet weak var tableEmployees: UITableView!
    
    var employees:[Employee] = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.employees.append(Employee(name: "Tushar", email: "tushar@transerve.com"))
        self.employees.append(Employee(name: "Swarupa", email: "swarupa@creative.com"))
        tableEmployees.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickAdd(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_HOME_EMPLOYEE, sender: self)
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return LocalConstants.EMPLOYEE_SECTIONS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCellEmployee = tableView.dequeueReusableCell(withIdentifier: LocalConstants.CELL_EMPLOYEE)! as! TableViewCellEmployee
        cell.labelName.text = self.employees[indexPath.row].name
        cell.labelEmail.text = self.employees[indexPath.row].email
        return cell
    }
}
