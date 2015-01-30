//
//  Vente.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Vente)
class Vente: NSManagedObject {

    @NSManaged var montant: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var client: Client
    @NSManaged var article: Article
    @NSManaged var transactions: NSSet

    class func keyPathsForValuesAffectingPaid() -> NSArray {
        return ["transactions"]
    }
    
    class func keyPathsForValuesAffectingMarge() -> NSArray {
        return ["article", "montant"]
    }
    
    var paid:NSNumber {
        get {
            return valueForKeyPath("transactions.@sum.montant") as NSNumber
        }
    }

    var balance:NSNumber {
        get {
            return montant.floatValue - paid.floatValue
        }
    }

    var marge:NSNumber {
        get {
            if let article = article as Article? {
                return montant.floatValue - article.prixTotal.floatValue
            }
            return montant.floatValue
        }
    }
    
}
