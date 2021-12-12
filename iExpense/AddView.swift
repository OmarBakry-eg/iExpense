//
//  AddView.swift
//  iExpense
//
//  Created by Omar Bakry on 12/12/2021.
//

import SwiftUI

struct AddView: View {
        @ObservedObject var expense : ExpensesController // We're not creation a new instance we just said this instance was created and we need to observe it
        @Environment (\.dismiss) var dismiss

        @State private var name : String = ""
        @State private var type : String = "Personal"
        @State private var amount : Double = 0.0
    
        let types = ["Business", "Personal"]

    var body: some View {
        NavigationView{
            Form {
               TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types,id : \.self){
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }.navigationBarTitle("Add new expense")
                .toolbar(content: {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expense.items.append(item)
                        dismiss()
                    }
                })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: ExpensesController())
    }
}
