//
//  DraftExpenseItemModel.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/17.
//

import Foundation

class DraftExpenseItemModel: ObservableObject {
    @Published var id = UUID()
    @Published var name: String
    @Published var type: String
    @Published var price: String
    
    init(_ expenseItem: ExpenseItemModel) {
        id = expenseItem.id
        name = expenseItem.name
        type = expenseItem.type
        price = expenseItem.price
    }
}
