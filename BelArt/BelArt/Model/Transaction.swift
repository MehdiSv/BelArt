//
//  Transaction.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 28/01/15.
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
    @NSManaged var vente: Vente
    @NSManaged var client: Client

    var price:NSNumber {
        get {
            return montant
        }
        set {
            
            self.valueForKey("achat")?.willChangeValueForKey("paid")
            self.valueForKey("vente")?.willChangeValueForKey("paid")
            self.willChangeValueForKey("price")
            
            montant = newValue
            
            self.didChangeValueForKey("price")
            self.valueForKey("achat")?.didChangeValueForKey("paid")
            self.valueForKey("vente")?.didChangeValueForKey("paid")
        }
    }
    
    override class func automaticallyNotifiesObserversForKey(key: String) -> Bool {
        if key == "price" {
            return true
        }
        return false
    }
    
    class func keyPathsForValuesAffectingHiddenEffet() -> NSArray {
        return ["moyen.moyen"]
    }
    
    class func keyPathsForValuesAffectingDate() -> NSArray {
        return ["dateEffet", "moyen.moyen"]
    }
    
    var hiddenEffet: Bool {
        get {
            
            if let moyen = moyen as Moyen? {
                return !(moyen.moyen == "Effet")
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
