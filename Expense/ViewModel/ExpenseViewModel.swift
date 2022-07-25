//
//  Expense.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/15.
//

import Foundation
//ViewModel
class ExpenseViewModel: ObservableObject {
    @Published
    var expenseItems = [
        ExpenseItemModel(name: "课程", type: "培训", price: "800"),
        ExpenseItemModel(name: "MacBook", type: "数码产品", price: "4500"),
        ExpenseItemModel(name: "iPhone", type: "数码", price: "6000")
    ]
    
    func addItem(item: ExpenseItemModel) {
        expenseItems.append(item)
        objectWillChange.send()
    }
    
    func delectItem(index: IndexSet) {
        expenseItems.remove(atOffsets: index)
        objectWillChange.send()
    }
    func editItem(draftItem: DraftExpenseItemModel) {
        let index = expenseItems.firstIndex { $0.id == draftItem.id }!
        let expenseItem = ExpenseItemModel(name: draftItem.name, type: draftItem.type, price: draftItem.price)
        expenseItems[index] = expenseItem
//        objectWillChange.send()
    }
    
    func upadateHomeUI() {
        objectWillChange.send()
    }
}
