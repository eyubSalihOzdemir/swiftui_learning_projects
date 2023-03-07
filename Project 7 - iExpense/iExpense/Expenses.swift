//
//  Expenses.swift
//  iExpense
//
//  Created by Salih Özdemir on 7.03.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encodedItems = try? encoder.encode(items) {
                UserDefaults.standard.set(encodedItems, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decodedItems = try? decoder.decode([ExpenseItem].self , from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
