//
//  ContentView.swift
//  Expense
//
//  Created by 覃冠宇 on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
//    @State private var showDetailView: Bool = false
    @StateObject var expenseViewModel = ExpenseViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(expenseViewModel.expenseItems) { expenseItem in
                    NavigationLink {
                        EditView(expense: expenseViewModel, draftExpenseItem: DraftExpenseItemModel(expenseItem))
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(expenseItem.name)
                                    .font(.headline)
                                Text(expenseItem.type)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text(expenseItem.price)
                        }
                    }
                }
                .onDelete { indexSet in
                    expenseViewModel.delectItem(index: indexSet)
                }
            }
            .navigationTitle("账单")
            .toolbar {
                NavigationLink {
                    AddView(expense: expenseViewModel)
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
            }
        }
        .navigationViewStyle(.stack)
//        .sheet(isPresented: $showDetailView) {
//            DetailView()
        }
//        .fullScreenCover(isPresented: $showDetailView) {
//            DetailView()
//        }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
