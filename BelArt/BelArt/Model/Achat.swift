//
//  Achat.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 19/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Achat)
class Achat: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var total: NSNumber
    @NSManaged var transactions: NSSet

}
