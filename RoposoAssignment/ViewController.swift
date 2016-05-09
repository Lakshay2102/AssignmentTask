//
//  ViewController.swift
//  RoposoAssignment
//
//  Created by Lakshay Gupta on 04/05/16.
//  Copyright © 2016 Lakshay Gupta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,NSFetchedResultsControllerDelegate{

    var fetchedResultController : FetchController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //New App
        if let path = NSBundle.mainBundle().pathForResource("iOSData", ofType: "json") {
            
            let data =   NSData(contentsOfFile:path)
            
            var json =  [AnyObject]()
            
            do{
                json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! [AnyObject]
                print(json.count)
                var userArray = [AnyObject]()
                if(json.count > 2)
                {
                    userArray.append(json[0])
                    userArray.append(json[1])
                    User.saveNewItemInNSRentity(userArray)
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
            
            
        } else {
            print("Invalid filename/path.")
        }
        
        
        getFetchedResultsController()
        
        
//         let propertyObj = fetchedResultController?.objectAtIndexPath(indexPath) as! NSR
        
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: FetchController Method
    func getFetchedResultsController() {
        fetchedResultController = FetchController(fetchRequest: listFetchRequest(), managedObjectContext: AppDelegateInstance.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController?.delegate = self
    }
    
    //MARK: FetchController Method
     func listFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "User")
        fetchRequest.fetchBatchSize = 20
//        let sortDescriptor = NSSortDescriptor(key: DEFAULT_SORT_ID, ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

}

//MARK:- FetchController Class
class FetchController:NSFetchedResultsController {
    
    var context = AppDelegateInstance.managedObjectContext
    override init(fetchRequest: NSFetchRequest, managedObjectContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName name: String?) {
        super.init(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: sectionNameKeyPath, cacheName: name)
        do {
            try self.performFetch()
        }
        catch let saveError as NSError {
            //print(saveError)
        }
        
    }
}


