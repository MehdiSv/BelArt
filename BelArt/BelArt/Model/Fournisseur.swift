//
//  Fournisseur.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 07/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Fournisseur)
class Fournisseur: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var nom: String
    @NSManaged var prenom: String
    @NSManaged var tel: String
    @NSManaged var reportDette: NSNumber
    @NSManaged var achats: NSSet
    @NSManaged var articles: NSSet

    var balance:NSNumber {
        get {
            let balanceAchats = valueForKeyPath("achats.@sum.balance") as NSNumber
            return balanceAchats.floatValue + reportDette.floatValue
        }
    }
    
    class func keyPathsForValuesAffectingBalance() -> NSArray {
        return ["reportDette"]
    }

    var totalBuyings:Float {
        get {
            
            var total:Float = 0
            
            for achat in achats.allObjects as [Achat] {
                total += (achat.total.floatValue - achat.remise.floatValue)
            }
            
            return total
            
        }
    }
    
    var totalSold:Float {
        get {
            
            var total:Float = 0
            
            for article in articles.allObjects as [Article] {
                
                if let vente = article.vente {
                    total += vente.montant.floatValue
                }
            }
            
            return total
        }
    }
    
    var totalSoldMarge:Float {
        get {
            
            var total:Float = 0
            
            for article in articles.allObjects as [Article] {
                
                if let vente = article.vente {
                    total += vente.marge.floatValue
                }
            }
            
            return total
        }
    }

}
