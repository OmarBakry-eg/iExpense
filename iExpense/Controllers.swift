//
//  Controllers.swift
//  iExpense
//
//  Created by Omar Bakry on 12/12/2021.
//UserDefaults is a small local storage so for performance if you wanna use it you may just save a small shunk of data like 512KB only.

import Foundation

class ExpensesController : ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encodedData = try? encoder.encode(items){
                UserDefaults.standard.set(encodedData, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedData) {
               items = decodedItems
                return
            }
        }
        items = []
    }
  
}

