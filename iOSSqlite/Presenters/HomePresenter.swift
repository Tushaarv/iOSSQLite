//
//  HomePresenter.swift
//  iOSSqlite
//
//  Created by Tushar Vengurlekar on 23/03/18.
//  Copyright © 2018 Tushaar's. All rights reserved.
//

import Foundation

private protocol HomePresenterProtocol {
    init(view:HomeView)
    func fetchEmployees()
    func deleteEmployee(employee:Employee)
}

class HomePresenter : HomePresenterProtocol {
    unowned let view:HomeView
    
    required init(view: HomeView) {
        self.view = view
    }
    
    func fetchEmployees() {
        self.view.populateEmployees(employees: Common.employees)
    }
    
    func deleteEmployee(employee:Employee) {
        let index:Int = Common.employees.index{$0 === employee}!
        Common.employees.remove(at: index)
        self.fetchEmployees()
    }
}
