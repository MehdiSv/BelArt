//
//  Transaction.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 19/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Transaction)
class Transaction: NSManagedObject {

    @NSManaged var montant: NSNumber
    @NSManaged var dateEffet: NSDate
    @NSManaged var moyen: Moyen
    @NSManaged var achat: NSManagedObject

    class func keyPathsForValuesAffectingHiddenEffet() -> NSArray {
        return ["moyen.moyen"]
    }

    var hiddenEffet: Bool {
        get {
            
            if let moyen = moyen as Moyen? {
                return  !(moyen.moyen == "Effet")
            }
            
            return true
        }
    }
}
