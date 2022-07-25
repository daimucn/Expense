//
//  EditView.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/17.
//

import SwiftUI

struct EditView: View {
    private let types = ["日常用品", "餐饮美食", "数码电器", "教育培训", "充值缴费"]
    @Environment(\.dismiss) var dismiss
    
//    可以被传过来的数据
    @ObservedObject var expense: ExpenseViewModel
    @ObservedObject var draftExpenseItem: DraftExpenseItemModel

    var body: some View {
        Form {
            Section("账单名称") {
                TextField("收入或支出来源", text: $draftExpenseItem.name)
            }
            Section("账单分类") {
                Picker("选择一个分类", selection: $draftExpenseItem.type) {
                    ForEach(types, id: \.self) {
                        Text($0) //$0是指数组里的每个元素
                    }
                }
            }
            Section("账单金额") {
                TextField("收入或支出了多少", text: $draftExpenseItem.price)
                    .keyboardType(.numberPad)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("修改账单")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    expense.upadateHomeUI()
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left").foregroundColor(.primary).padding()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    expense.editItem(draftItem: draftExpenseItem)
                    dismiss()
                } label: {Text("保存").foregroundColor(.primary)}
            }
        }

    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView(expense: Expense(), expenseItem: ExpenseItemModel(name: "课程", type: "培训", price: "800"))
//    }
//}
