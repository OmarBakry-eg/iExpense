//
//  model.swift
//  iExpense
//
//  Created by Omar Bakry on 12/12/2021.
//

import Foundation


struct ExpenseItem: Identifiable , Codable {
    var id : UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
