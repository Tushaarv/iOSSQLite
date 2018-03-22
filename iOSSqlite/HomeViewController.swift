//
//  HomeViewController.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 21/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private struct LocalConstants {
        
        // Segues
        static let SEGUE_HOME_EMPLOYEE:String = "SEGUE_HOME_EMPLOYEE"
        
        // For Table
        static let EMPLOYEE_SECTIONS:Int = 1
        static let CELL_EMPLOYEE = "CELL_EMPLOYEE"
    }
    
    @IBOutlet weak var tableEmployees: UITableView!
    
    var employees:[Employee] = [Employee]()
    var selectedEmployee:Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchEmployees()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didClickAdd(_ sender: UIBarButtonItem) {
        self.selectedEmployee = nil
        self.showEmployeeScreen()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == LocalConstants.SEGUE_HOME_EMPLOYEE {
            let employeeViewController: EmployeeViewController = segue.destination as! EmployeeViewController
            employeeViewController.selectedEmployee = self.selectedEmployee
            if self.selectedEmployee == nil {
                employeeViewController.mode = EmployeeViewController.Mode.new
            }
            else {
                employeeViewController.mode = EmployeeViewController.Mode.view
            }
        }
    }
    
    func showEmployeeScreen() {
        self.performSegue(withIdentifier: LocalConstants.SEGUE_HOME_EMPLOYEE, sender: self)
    }
    
    func fetchEmployees() {
        self.employees = [Employee]()
        self.employees.append(contentsOf: Common.employees)
        tableEmployees.reloadData()
    }
    
    func deleteEmployee(indexPath:IndexPath) {
        let employee =  self.employees[indexPath.row]
        let index:Int = employees.index{$0 === employee}!
        Common.employees.remove(at: index)
        fetchEmployees()
        tableEmployees.reloadData()
        //        tableEmployees.deleteRows(at: [indexPath], with: .automatic)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedEmployee = self.employees[indexPath.row]
        self.showEmployeeScreen()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.deleteEmployee(indexPath: indexPath)
        }
    }
}
