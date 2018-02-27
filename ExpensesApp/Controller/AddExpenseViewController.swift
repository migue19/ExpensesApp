//
//  AddExpenseViewController.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {
    @IBOutlet weak var txtConcept: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var btnAction: ButtonCustom!
    let expenseDAO = ExpensesDAO()
    var expense = Expense()
    var isUpdate:Bool = false
    var conceptaux:String = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = UIDatePickerMode.date
        
        
        dataPicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        

        
        self.txtDate.inputView = dataPicker
        
        let toolbar = UIToolbar.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 44))
        toolbar.tintColor = Colors.colorPrincipal
        
        
        
        
        let doneBtn = UIBarButtonItem.init(title: "OK", style: .plain, target: self, action: #selector(closePicker(sender:)))
        
        let space = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([space,doneBtn], animated: false)
        
        self.txtDate.inputAccessoryView = toolbar
        
        
        
        
        if(expense.concept != ""){
            txtConcept.text = expense.concept
            txtDate.text =  Utils.dateFormat(date: expense.date)
            txtPrice.text = Utils.numberFormat(price: expense.price)
            
            
            conceptaux = txtConcept.text!
            isUpdate = true
            
            btnAction.setTitle("Actualizar", for: .normal)
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveExpense(_ sender: Any) {
        let concept = txtConcept.text
        //let date:Date = Utils.stringToDate(strDate: txtDate.text!)
        let price:Double = Double(txtPrice.text!)!
        let date:Date = Utils.stringToDate(strDate: txtDate.text!)
        
        let newExpense = Expense.init(concept: concept!, date: date, price: price)
        
        
        if(isUpdate == true){
           let expense =  expenseDAO.getObjectByConcept(concept: conceptaux)
           expenseDAO.UpdateObjectCoreData(expense: expense!, newExpense: newExpense)
        }
        else{
            expenseDAO.InsertObject(expense: newExpense)
        }
        
        
        expenseDAO.getData()
        self.dismiss(animated: true, completion: nil)
 
    }
    
    
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: sender.date)
        
        self.txtDate.text = dateString
        
    }
    
    
    @objc func closePicker(sender: UIBarButtonItem) {
        self.txtDate.resignFirstResponder()
    }
    
    
    
   
}
