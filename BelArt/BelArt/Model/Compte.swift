//
//  Compte.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 05/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Compte)
class Compte: NSManagedObject {

    @NSManaged var nom: String
    @NSManaged var transactions: NSSet

}
