//
//  CoreDataImage+CoreDataProperties.swift
//  RememberPhotos
//
//  Created by Salih Özdemir on 9.04.2023.
//
//

import Foundation
import CoreData


extension CoreDataImage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataImage> {
        return NSFetchRequest<CoreDataImage>(entityName: "CoreDataImage")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }

}

extension CoreDataImage : Identifiable {

}
