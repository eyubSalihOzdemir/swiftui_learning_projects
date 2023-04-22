//
//  CachedFriend+CoreDataProperties.swift
//  Users
//
//  Created by Salih Özdemir on 28.03.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var friendOf: CachedUser?
    
    public var wrappedId: String {
        id ?? "Unknown id"
    }

    public var wrappedName: String {
        name ?? "Unknown name"
    }


}

extension CachedFriend : Identifiable {

}
