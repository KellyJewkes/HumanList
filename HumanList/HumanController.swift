//
//  HumanController.swift
//  HumanList
//
//  Created by Kelly Jewkes on 3/2/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import Foundation
import CoreData

class HumanController {
    
    //Shared instance
    static let shared = HumanController()
    
    var humans: [Human] {
        let request: NSFetchRequest<Human> = Human.fetchRequest()
        let thisArray = (try? CoreDataStack.context.fetch(request)) ?? []
        return thisArray
    }
        // sections array
    let sections: [String] = ["Team 1", "Team 2", "Team 3"]
    
    //MARK: - Crud
    func add(humanWith name: String) {
        let _ = Human(name: name)
        saveToPersistentStore()
    }
    
    func delete(humanWith human: Human){
        human.managedObjectContext?.delete(human)
        saveToPersistentStore()
    }
    
    //MARK: - Save to Core Data
    func saveToPersistentStore() {
        do{
            try CoreDataStack.context.save()
        }catch{
            print("error in saving to core data: \(error.localizedDescription)")
        }
    }
}
