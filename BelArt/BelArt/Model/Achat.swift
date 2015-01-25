//
//  Achat.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Achat)
class Achat: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var total: NSNumber
    @NSManaged var transactions: NSSet
    @NSManaged var fournisseur: Fournisseur

        
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
            return total.floatValue - paid.floatValue
        }
    }
}
