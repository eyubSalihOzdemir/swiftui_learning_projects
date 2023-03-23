//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var name: String?
    @NSManaged public var releaseDate: Date?
    
    var wrappedDirector: String {
        director ?? "Unknown director"
    }
    
    var wrappedName: String {
        name ?? "Unknown name"
    }
}

extension Movie : Identifiable {

}
