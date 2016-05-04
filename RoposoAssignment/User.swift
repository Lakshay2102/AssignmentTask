//
//  User.swift
//  RoposoAssignment
//
//  Created by Lakshay Gupta on 05/05/16.
//  Copyright © 2016 Lakshay Gupta. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    // Insert code here to add functionality to your managed object subclass
    //MARK: Create entity Object
    class func createUserObj(var data: Dictionary<String, NSObject>)->User {
        var entity : NSEntityDescription?
        

        
        entity = NSEntityDescription.entityForName("User", inManagedObjectContext:ModelController.sharedInstance.privateContext)
        var userObj = User(entity: entity!, insertIntoManagedObjectContext: ModelController.sharedInstance.privateContext)
        userObj = userObj.initializeObj(userObj, withData: data)
        
        return userObj
    }
    
    //MARK: Initialize entity Object with Values
    func initializeObj(usrObj : User, withData data:Dictionary<String, NSObject>)->User {
        
        
    
        usrObj.id = data["id"] as? String
        usrObj.createdOn = data["createdOn"] as? String
        usrObj.followers = data["followers"] as? NSNumber
        usrObj.following = data["following"] as? NSNumber
        usrObj.about = data["is_following"] as? String
        usrObj.handle = data["handle"] as? String
        usrObj.image = data["image"] as? String
        usrObj.is_folllowing = data["is_following"] as? NSNumber
        usrObj.username = data["userName"] as? String
        usrObj.handle = data["handle"] as? String
        usrObj.url = data["url"] as? String
        usrObj.image = data["image"] as? String
       
    
        
        return usrObj
    }
    
    //MARK: Save entity Object
    class func saveNewItemInNSRentity(itemArray: NSArray) -> Bool
    {
        let itemArrToBeInserted = NSMutableArray()
        for usr in itemArray {
           
                let itemToBeInserted : User = usr as! User
                
//                let nsrDict = itemToBeInserted.toDictionary() as! Dictionary<String, NSObject>
//                itemArrToBeInserted.addObject(self.createUserObj(itemToBeInserted))
        }
        
        if itemArrToBeInserted.count > 0 {
            return ModelController.sharedInstance.savePrivateContext()
        }
        else {
            return false
        }
    }
    
 

}
