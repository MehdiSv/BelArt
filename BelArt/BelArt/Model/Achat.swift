//
//  Achat.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 28/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Achat)
class Achat: NSManagedObject {
    
    @NSManaged var date: NSDate
    @NSManaged var total: NSNumber
    @NSManaged var remise: NSNumber
    @NSManaged var fournisseur: Fournisseur
    @NSManaged var transactions: NSSet
    
    class func keyPathsForValuesAffectingPaid() -> NSArray {
        return ["transactions"]
    }
    
    var paid:NSNumber {
        get {
            return valueForKeyPath("transactions.@sum.montant") as NSNumber
        }
    }
    
    var balance:NSNumber {
        get {
            return total.floatValue - paid.floatValue - remise.floatValue
        }
    }
}
