//
//  CoreDataStack.swift
//  HumanList
//
//  Created by Kelly Jewkes on 3/2/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import Foundation

import  CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Human")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext}
}

