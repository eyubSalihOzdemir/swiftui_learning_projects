//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//

import CoreData
import SwiftUI

enum PredicateType: String {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case containsCI = "CONTAINS[c]"
    case equals = "=="
}

struct FilteredList<T:  NSManagedObject, Content: View>: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List {
            ForEach(fetchRequest, id: \.self) { item in
                self.content(item)
            }
            .onDelete(perform: deleteItems)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        if filterValue == "" {
            _fetchRequest = FetchRequest<T>(sortDescriptors: [])
        } else {
            _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(PredicateType.equals.rawValue) %@", filterKey, filterValue))
        }
        
        self.content = content
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let item = fetchRequest[offset]

            // delete it from the context
            moc.delete(item)
        }

        // save the context
        try? moc.save()
    }
}
