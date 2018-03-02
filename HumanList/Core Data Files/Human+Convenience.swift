//
//  Human+Convenience.swift
//  HumanList
//
//  Created by Kelly Jewkes on 3/2/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import Foundation
import CoreData

extension Human {
    
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init (context: context)
        self.name = name
    }
    
}
