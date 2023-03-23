//
//  Car+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var brand: String?
    @NSManaged public var model: String?
    
    var wrappedBrand: String {
        brand ?? "Unknown brand"
    }
        
    var wrappedModel: String {
        model ?? "Unknown model"
    }

}

extension Car : Identifiable {

}
