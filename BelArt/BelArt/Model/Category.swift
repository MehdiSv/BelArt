//
//  Category.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 17/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Category)
class Category: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var relationship: NSSet

}
