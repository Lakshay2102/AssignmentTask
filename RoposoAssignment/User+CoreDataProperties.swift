//
//  User+CoreDataProperties.swift
//  RoposoAssignment
//
//  Created by Lakshay Gupta on 05/05/16.
//  Copyright © 2016 Lakshay Gupta. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var about: String?
    @NSManaged var createdOn: String?
    @NSManaged var followers: NSNumber?
    @NSManaged var following: NSNumber?
    @NSManaged var handle: String?
    @NSManaged var id: String?
    @NSManaged var image: String?
    @NSManaged var is_folllowing: NSNumber?
    @NSManaged var url: String?
    @NSManaged var username: String?

}
