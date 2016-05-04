//
//  Story+CoreDataProperties.swift
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

extension Story {

    @NSManaged var comment_count: NSNumber?
    @NSManaged var db: String?
    @NSManaged var description_story: String?
    @NSManaged var id: String?
    @NSManaged var like_count: NSNumber?
    @NSManaged var like_flag: NSNumber?
    @NSManaged var si: String?
    @NSManaged var title: String?
    @NSManaged var type: String?
    @NSManaged var url: String?
    @NSManaged var verb: String?

}
