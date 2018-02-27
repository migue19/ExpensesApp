//
//  Utils.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func numberFormat(price:Double) -> String {
        return String(format:"%.2f", price)
    }
    
    static func numberFormatCell(price:Double) -> String {
        return "$" + String(format:"%.2f", price)
    }
    
    
    static func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "dd/MM/yyyy"
        
        let strDate = formatter.string(from: date)

        return strDate
    }
    
    
    static func stringToDate(strDate: String)->Date{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "dd/MM/yyyy"
        
       let date = formatter.date(from: strDate)
 
        return date!
    }
    
    

}
