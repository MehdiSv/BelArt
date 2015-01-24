//
//  Transaction.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Transaction)
class Transaction: NSManagedObject {

    @NSManaged var dateEffet: NSDate
    @NSManaged var montant: NSNumber
    @NSManaged var achat: Achat
    @NSManaged var moyen: Moyen
    @NSManaged var vente: NSManagedObject

    class func keyPathsForValuesAffectingHiddenEffet() -> NSArray {
        return ["moyen.moyen"]
    }

    class func keyPathsForValuesAffectingDate() -> NSArray {
        return ["dateEffet", "moyen.moyen"]
    }

    var hiddenEffet: Bool {
        get {
            
            if let moyen = moyen as Moyen? {
                return  !(moyen.moyen == "Effet")
            }
            
            return true
        }
    }
    
    var date:NSDate? {
        get {
            if let moyen = moyen as Moyen? {
                if moyen.moyen == "Effet" {
                    return dateEffet
                }
            }
            
            return nil
        }
    }

}
