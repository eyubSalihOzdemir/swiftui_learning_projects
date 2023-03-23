//
//  Song+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Salih Özdemir on 19.03.2023.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var artist: String?
    @NSManaged public var name: String?
    
    var wrappedArtist: String {
        artist ?? "Unknown artist"
    }
    
    var wrappedName: String {
        name ?? "Unknown name"
    }
}

extension Song : Identifiable {

}
