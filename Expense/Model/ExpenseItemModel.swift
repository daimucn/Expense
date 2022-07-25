//
//  ExpenseItem.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/15.
//

import Foundation

struct ExpenseItemModel: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var price: String
}
