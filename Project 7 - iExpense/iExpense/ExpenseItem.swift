//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Salih Özdemir on 7.03.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
