//
//  Transaction.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 06/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Transaction)
class Transaction: NSManagedObject {

    @NSManaged var date: NSDate?
    @NSManaged var dateEffet: NSDate
    @NSManaged var montant: NSNumber
    @NSManaged var nom: String
    @NSManaged var shopExpense: NSNumber
    @NSManaged var achat: Achat
    @NSManaged var client: Client
    @NSManaged var compte: Compte
    @NSManaged var moyen: Moyen?
    @NSManaged var vente: Vente

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
    
    class func keyPathsForValuesAffectingDateEffetAvailable() -> NSArray {
        return ["dateEffet", "moyen.moyen"]
    }
    
    var hiddenEffet: Bool {
        get {
            
            if let moyen = moyen {
                return !((moyen.moyen == "Effet") || (moyen.moyen == "Cheque"))
            }
            
            return true
        }
    }
    
    var dateEffetAvailable:NSDate? {
        get {
            if let moyen = moyen {
                if moyen.moyen == "Effet" || moyen.moyen == "Cheque" {
                    return dateEffet
                }
            }
            
            return nil
        }
    }

}
