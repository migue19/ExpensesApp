//
//  ExpensesViewController.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class ExpenseViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var expenses: [Expenses] = []
    let expensesDAO = ExpensesDAO()
    var total = 0.0
    
    @IBOutlet weak var lblTotal: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // expenses = expensesDAO.ObtenerObjects()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        total = 0
        expenses = expensesDAO.getObjectsSortDate()
        tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let isAdd = (sender is UIBarButtonItem)
        
        
        if segue.identifier == "showExpense" {
            
            let destination = segue.destination as! AddExpenseViewController
            
            
            if !isAdd{
                let auxactividad = sender as! Expense
                destination.expense = auxactividad
            }
            else{
                destination.expense = Expense()
            }
        }
    }



}






// MARK: - TableView Delegate
extension ExpenseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hola")

        let acttividadAux = Expense.init(concept: self.expenses[indexPath.row].concept! , date: self.expenses[indexPath.row].date!, price: self.expenses[indexPath.row].price)
        
        self.performSegue(withIdentifier: "showExpense", sender: acttividadAux)
        
        tableView.deselectRow(at: indexPath, animated: true)
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
        
        cell.lblConcept.text = self.expenses[indexPath.row].concept
        cell.lblDate.text = Utils.dateFormat(date: self.expenses[indexPath.row].date!)
        
        total =  total + self.expenses[indexPath.row].price
        
        cell.lblPrice.text = Utils.numberFormatCell(price: self.expenses[indexPath.row].price)
        
        self.lblTotal.text = Utils.numberFormatCell(price: total)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        expensesDAO.deleteActividadCoreData(expense: expenses[indexPath.row])

        expenses.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        total = 0
        tableView.reloadData()
    }
    
    
    
    
    
  
}






