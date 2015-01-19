//
//  Article.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 18/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Article)
class Article: NSManagedObject {

    @NSManaged var nom: String
    @NSManaged var prixAchat: NSNumber
    @NSManaged var prixGr: NSNumber
    @NSManaged var poids: NSNumber
    @NSManaged var category: Category
    @NSManaged var fournisseur: Fournisseur
    
    class func keyPathsForValuesAffectingPrixTotal() -> NSArray {
        return ["poids", "prixGr"]
    }
    
    var prixTotal: NSNumber {
        get {
            
            if prixAchat != 0 {
                println("prixAchat = \(prixAchat)")
                return prixAchat
            }
            println(prixGr.floatValue * poids.floatValue)
            return prixGr.floatValue * poids.floatValue
        }
        
        set {
            println(newValue)
            prixAchat = newValue
        }
    }
}
