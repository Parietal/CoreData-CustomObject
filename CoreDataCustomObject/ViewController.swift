//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by duruldalkanat on 12/07/14.
//  Copyright (c) 2014 durulair. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func btnSave() {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let enter = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: enter, insertIntoManagedObjectContext: context)
        
        
        newUser.username = txtUserName.text
        newUser.password =  txtPassword.text
        
        context.save(nil)
        
        println(newUser)
        println("object save")
        
    }
    
    @IBAction func btnLoad() {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false;
        request.predicate = NSPredicate(format: "username = %@", "" + txtUserName.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if results.count > 0 {
            
            var res = results[0] as NSManagedObject
            txtUserName.text = res.valueForKey("username") as String
            txtPassword.text = res.valueForKey("password") as String
            
            for user in results {
            
                var thisUser = user as Users
                println(thisUser.toString())
                thisUser.addFunnyPrefix("hah")
                println(thisUser.toString())
                
            }
        } else {
            println("0 results")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

