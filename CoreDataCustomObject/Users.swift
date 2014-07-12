//
//  Users.swift
//  CoreDataSwift
//
//  Created by duruldalkanat on 12/07/14.
//  Copyright (c) 2014 durulair. All rights reserved.
//

import UIKit
import CoreData

@objc(Users)

class Users: NSManagedObject {
    
    @NSManaged var username: String
    @NSManaged var password: String
    
    
    func toString() -> String {
        return "the username is \(username) their is \(password)"
    }
    
    
    func addFunnyPrefix(prefix: String) {
        username = prefix + username
    }
    
    func validPassword(inputPassword: String) -> Bool {
        if inputPassword == password {
            return true
        } else {
            return false
        }
    }
}
