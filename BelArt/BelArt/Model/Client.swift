//
//  Client.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 28/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Client)
class Client: NSManagedObject {

    @NSManaged var email: String
    @NSManaged var nom: String
    @NSManaged var prenom: String
    @NSManaged var tel: String
    @NSManaged var achats: NSSet
    @NSManaged var transactions: NSSet

    var balance:NSNumber {
        get {
            return valueForKeyPath("achats.@sum.balance") as NSNumber
        }
    }
    
    var fullName:String {
        
        get {
            
            return prenom + nom
            
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
