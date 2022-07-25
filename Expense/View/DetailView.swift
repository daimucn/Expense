//
//  DetailView.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/15.
//

import SwiftUI

struct DetailView: View {
    private let types = ["日常用品", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    @State private var name = ""
    @State private var type = "日常用品"
    @State private var price = ""
    @Environment(\.dismiss) var dismiss
    
//    可以被传过来的数据
    @ObservedObject var expense: ExpenseViewModel
    var expenseItem: ExpenseItemModel?

//    计算属性
    var isAddingPage: Bool { expenseItem == nil }
    var expenseItemIndex: Int? {
        expense.expenseItems.firstIndex { $0.id == expenseItem?.id }
    }
    var body: some View {
        Form {
            Section("账单名称") {
                TextField("收入或支出来源", text: isAddingPage ? $name : $expense.expenseItems[expenseItemIndex!].name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: isAddingPage ? $type : $expense.expenseItems[expenseItemIndex!].type) {
                    ForEach(types, id: \.self) {
                        Text($0) //$0是指数组里的每个元素
                    }
                }
            }
            Section("账单金额") {
                TextField("收入或支出了多少", text: isAddingPage ? $price : $expense.expenseItems[expenseItemIndex!].price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle(isAddingPage ? "添加账单" : "修改账单")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary).padding()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isAddingPage {
                        expense.addItem(item: ExpenseItemModel(name: name, type: type, price: price))
                    } else {
//                            expense.editItem()
                    }
                    dismiss()
                } label: {Text("保存").foregroundColor(.primary)}
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(expense: ExpenseViewModel(), expenseItem:  ExpenseItemModel(name: "课程", type: "培训", price: "800"))
    }
}
