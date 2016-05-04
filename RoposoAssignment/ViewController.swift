//
//  ViewController.swift
//  RoposoAssignment
//
//  Created by Lakshay Gupta on 04/05/16.
//  Copyright © 2016 Lakshay Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
                if(json.count > 2)
                {
//                    json[1]
                }
            }
            catch {
                print("error serializing JSON: \(error)")
            }
            
            
        } else {
            print("Invalid filename/path.")
        }
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

