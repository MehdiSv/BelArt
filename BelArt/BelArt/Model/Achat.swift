//
//  Achat.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 06/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Achat)
class Achat: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var remise: NSNumber
    @NSManaged var total: NSNumber
    @NSManaged var orRemis: NSNumber
    @NSManaged var orRecu: NSNumber
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
