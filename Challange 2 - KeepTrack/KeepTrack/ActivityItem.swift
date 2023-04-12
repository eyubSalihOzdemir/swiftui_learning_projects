//
//  ActivityItem.swift
//  KeepTrack
//
//  Created by Salih Özdemir on 11.03.2023.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Hashable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
}
