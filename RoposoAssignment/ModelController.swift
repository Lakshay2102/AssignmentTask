//
//  ModelController.swift
//  RoposoAssignment
//
//  Created by Lakshay Gupta on 05/05/16.
//  Copyright © 2016 Lakshay Gupta. All rights reserved.
//

import Foundation
import CoreData
import UIKit

//  A Model controller class that has all methods to perform Coredata Operations.

class ModelController
{
    
    private var context: NSManagedObjectContext
    var privateContext: NSManagedObjectContext
    
    
    class var sharedInstance: ModelController
    {
        struct Static
        {
            static var onceToken: dispatch_once_t = 0
            static var instance: ModelController? = nil
        }
        
        dispatch_once(&Static.onceToken)
            {
                Static.instance = ModelController()
        }
        return Static.instance!
    }
    
    init()
    {
        context = AppDelegateInstance.managedObjectContext
        
        privateContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        privateContext.parentContext = context
        
    }
    
    //MARK: Fetch Request Method
    
    // Works in case of Main context
    func getBasicRequestForEntityName(entityName: NSString) -> NSFetchRequest
    {
        let fetchRequest = NSFetchRequest()
        
        let entityMB = NSEntityDescription.entityForName(entityName as String, inManagedObjectContext:context)
        fetchRequest.entity = entityMB
        
        return fetchRequest
    }
    
    
    // Works in case of Private context
    func getBasicRequestForEntityNameInPrivateCase(entityName: NSString) -> NSFetchRequest
    {
        let fetchRequest = NSFetchRequest()
        
        let entityMB = NSEntityDescription.entityForName(entityName as String, inManagedObjectContext:privateContext)
        fetchRequest.entity = entityMB
        
        return fetchRequest
    }
    
    
    //MARK: Save Object
    func savePrivateContext() ->Bool{
        //Persist new Property to datastore (via Managed Object Context Layer).
        var success:Bool
        do
        {
            
            try privateContext.save()
            success = true
        }
        catch  _ as NSError
        {
            success = false
        }
        
        return success
    }
    
    func saveMainContext() ->Bool{
        //Persist new Property to datastore (via Managed Object Context Layer).
        var success:Bool
        do
        {
            
            try context.save()
            success = true
        }
        catch  _ as NSError
        {
            success = false
        }
        
        return success
    }
    
    //MARK: Retieval of All Object of an enity
    func getAllObjectForEntity(entityName : String, withFetchRequest fetchRequest : NSFetchRequest?) -> NSArray?
    {
        let fetchReq : NSFetchRequest!
        
        if fetchRequest == nil {
            fetchReq = getBasicRequestForEntityName(entityName)
        }
        else {
            let entityMB = NSEntityDescription.entityForName(entityName, inManagedObjectContext:context)
            fetchRequest?.entity = entityMB
            fetchReq = fetchRequest
        }
        
        var list = NSArray()
        do
        {
            list = try privateContext.executeFetchRequest(fetchReq)
            // success ...
        }
        catch let error as NSError
        {
            // failure
            //print(error)
        }
        
        return list
    }
    
    //MARK: Retieval of All Object of an enity from main context
    func getAllObjectForEntityFromMainContext(entityName : String, withFetchRequest fetchRequest : NSFetchRequest?) -> NSArray?
    {
        let fetchReq : NSFetchRequest!
        
        if (fetchRequest == nil) {
            fetchReq = getBasicRequestForEntityName(entityName)
        }
        else {
            let entityMB = NSEntityDescription.entityForName(entityName, inManagedObjectContext:context)
            fetchRequest?.entity = entityMB
            fetchReq = fetchRequest
        }
        
        var list = NSArray()
        do
        {
            list = try context.executeFetchRequest(fetchReq)
            // success ...
        }
        catch let error as NSError
        {
            // failure
            //print(error)
        }
        
        return list
}
}
