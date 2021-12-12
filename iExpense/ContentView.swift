//
//  ContentView.swift
//  iExpense
//
//  Created by Omar Bakry on 12/12/2021.
// StateObject prefered to use for creation and ObservedObject prefered to use for passing or observe the created object before


import SwiftUI

struct ContentView: View {
    @StateObject var expense = ExpensesController()
    @State private var showingAddExpense : Bool = false
    var body: some View {
        NavigationView{
           List {
                ForEach(expense.items) {
                    item in
                    HStack {
                        VStack {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD") )
                    }
                }.onDelete(perform: {
                    dataOffset in
                    expense.items.remove(atOffsets: dataOffset)
                })
            }.navigationBarTitle("iExpense")
                .toolbar(content: {
                    Button{
                        showingAddExpense = true
                    } label :{
                        Image(systemName: "plus")
                    }
                })
                .sheet(isPresented: $showingAddExpense ,content: {
                    AddView(expense: expense)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
