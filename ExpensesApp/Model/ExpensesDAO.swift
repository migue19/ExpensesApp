//
//  ExpensesDAO.swift
//  ExpensesApp
//
//  Created by Miguel Mexicano on 26/02/18.
//  Copyright © 2018 Miguel Mexicano. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class ExpensesDAO {
    var actividades: [Expenses] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func InsertObject(expense: Expense){
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Expenses> = Expenses.fetchRequest()
        
        request.predicate = NSPredicate(format: "concept = %@", expense.concept)
        
        do{
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0{
                print("Updateando Actividad")
                UpdateObjectCoreData(expense: fetchResult[0], newExpense: expense)
            }else{
                print("Insertando Actividad")
                let newExpense = Expenses(context: context)
                
                newExpense.concept = expense.concept
                newExpense.date = expense.date
                newExpense.price = expense.price
                
                
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
        catch{
            print("No se pudo hacer la conexion con la DB")
            
        }
    }
    
    func UpdateObjectCoreData(expense: Expenses,newExpense: Expense) {
        expense.setValue(newExpense.concept, forKey: "concept")
        expense.setValue(newExpense.date, forKey: "date")
        expense.setValue(newExpense.price, forKey: "price")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    func ObtenerObjects()->[Expenses]{
        
        do {
            let actividades = try context.fetch(Expenses.fetchRequest())
            return actividades as! [Expenses]
            
        }catch{
            print("Error al obtener los Datos de la DB-> AppDelegate ")
            return []
        }
    }
    
    
    
    func getObjectByConcept(concept: String)->Expenses?{
        
        let context = AppDelegate.viewContext
        
        let request: NSFetchRequest<Expenses> = Expenses.fetchRequest()
        
        request.predicate = NSPredicate(format: "concept = %@", concept)
        
        do{
            let fetchResult = try context.fetch(request)
            if fetchResult.count > 0{
                print("Updateando Actividad")
                return fetchResult[0]
            }else{
               return nil
            }
        }catch{
            print("No se pudo hacer la conexion con la DB")
            return nil
        }
        
    }
    
    
    
    func getObjectsSortDate()->[Expenses]{
        
        do {
            let sectionSortDescriptor = NSSortDescriptor(key: "date", ascending: true)
            let sortDescriptors = [sectionSortDescriptor]
            
            let consulta:NSFetchRequest<Expenses> =  Expenses.fetchRequest()
            consulta.sortDescriptors = sortDescriptors

            let actividades = try context.fetch(consulta)
            return actividades
            
        }catch{
            print("Error al obtener los Datos de la DB-> AppDelegate ")
            return []
        }
    }
    
    
    
    func deleteActividadCoreData(expense: Expenses){
        let context = AppDelegate.viewContext
        
        context.delete(expense)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    
    
    func getData(){
        do{
            actividades = try context.fetch(Expenses.fetchRequest())
            
            if actividades.count > 0 {
                for actividad in actividades{
                    print(actividad.concept ?? "")
                    print(actividad.date ?? "")
                    print(actividad.price)
                }
            }else{
                print("No Hay Datos Para Mostrar")
            }
        }
        catch{
            print("Failed feching")
        }
        
    }
    
    
    
    
    
    
}
