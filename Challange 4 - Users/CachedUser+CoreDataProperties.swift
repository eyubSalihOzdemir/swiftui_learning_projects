//
//  CachedUser+CoreDataProperties.swift
//  Users
//
//  Created by Salih Özdemir on 28.03.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    public var wrappedAbout: String {
        about ?? "Unknown about"
    }

    public var wrappedAddress: String {
        address ?? "Unkonwn address"
    }

    public var wrappedCompany: String {
        company ?? "Unknown company"
    }

    public var wrappedEmail: String {
        email ?? "Unknown email"
    }

    public var wrappedId: String {
        id ?? "Unknown id"
    }

    public var wrappedName: String {
        name ?? "Unknown name"
    }

    public var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    public var tagsArray: [String] {
        if let tags = tags {
            return tags.components(separatedBy: ",")
        } else {
            return []
        }
    }

    public var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
