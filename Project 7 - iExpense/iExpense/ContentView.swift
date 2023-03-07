//
//  ContentView.swift
//  iExpense
//
//  Created by Salih Özdemir on 5.03.2023.
//

import SwiftUI

struct ColoredDot: View {
    let amount: Double
    var color: Color {
        switch amount {
        case _ where amount <= 10:
            return .green
        case _ where amount <= 100:
            return .orange
        default:
            return .red
        }
    }
    var body: some View {
        color
            .clipShape(Circle())
            .frame(width: 10, height: 10)
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
    //                .onDelete(perform: removeItems)
                    Section("Personal") {
                        ForEach(expenses.items.filter { item in
                            item.type == "Personal"
                        }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                
                                ColoredDot(amount: item.amount)
                            }
                        }
                        .onDelete { offsets in
                            removeItems(at: offsets, type: "Personal")
                        }
                    }
                    
                    Section("Business") {
                        ForEach(expenses.items.filter { item in
                            item.type == "Business"
                        }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
        
                                Spacer()
        
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        
                                ColoredDot(amount: item.amount)
                            }
                        }
                        .onDelete { offsets in
                            removeItems(at: offsets, type: "Business")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
        
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet, type: String) {
        /// deleting the correct values from filtered lists does not work, I'll deal with it later
        
        //expenses.items.remove(atOffsets: offsets)
        var filteredList = expenses.items.filter { item in
            item.type == type
        }
        
        filteredList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
