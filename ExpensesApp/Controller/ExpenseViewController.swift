//
//  ExpensesViewController.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    let expenses = ["Renta","Luz","Gas","Internet"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}


// MARK: - TableView Delegate
extension ExpenseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }

}

// MARK: - TableView DataSource
extension ExpenseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell:ExpenseTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExpenseTableViewCell!
        
        cell.lblConcept.text = self.expenses[indexPath.row]
        
        return cell
    }
    
  
}






