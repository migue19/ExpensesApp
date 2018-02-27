//
//  Expense.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class Expense: NSObject {
   var concept:String! = String()
   var date: Date! = Date ()
   var price: Double = Double()
    
    
    override init(){
        
    }
    
    init(concept: String, date: Date, price: Double){
        self.concept = concept
        self.date = date
        self.price = price
    }

    
    
//    func getConcept(concept:String) -> String {
//        return self.concept
//    }
//
//    func getDate(date: Date) -> Date {
//        return self.date
//    }
//
//    func getPrice(price: Double) -> Double{
//        return self.price
//    }
    
    
    
}
