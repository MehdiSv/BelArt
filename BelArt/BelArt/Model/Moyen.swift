//
//  Moyen.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 19/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Moyen)
class Moyen: NSManagedObject {

    @NSManaged var moyen: String
    @NSManaged var transaction: NSManagedObject

}
