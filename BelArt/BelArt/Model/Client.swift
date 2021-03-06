//
//  Client.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 07/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Client)
class Client: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var nom: String?
    @NSManaged var prenom: String
    @NSManaged var tel: String
    @NSManaged var reportDette: NSNumber
    @NSManaged var achats: NSSet
    @NSManaged var transactions: NSSet

    var balance:NSNumber {
        get {
            let balanceAchats = valueForKeyPath("achats.@sum.balance") as NSNumber
            return balanceAchats.floatValue + reportDette.floatValue
        }
    }

    class func keyPathsForValuesAffectingBalance() -> NSArray {
        return ["reportDette"]
    }

    class func keyPathsForValuesAffectingFullName() -> NSArray {
        return ["nom", "prenom"]
    }
    
    
    var fullName:String {
        
        get {
            if let name = nom {
                return prenom + " " + name
            }
            return ""
        }
        
    }
    
    var buyings:Float {
        get {
            
            var total:Float = 0
            for achat in achats.allObjects as [Vente] {
                
                total += achat.montant.floatValue
                
            }
            
            return total
            
        }
    }

}
