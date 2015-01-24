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

    class func keyPathsForValuesAffectingPrixGr() -> NSArray {
        return ["prixAchat"]
    }

    var prixTotal: NSNumber {
        get {
            
            if prixGr == 0 {
                return prixAchat
            }
            return prixGr.floatValue * poids.floatValue
        }
        
        set {
            prixGr = 0
            poids = 0
            prixAchat = newValue
        }
    }
    
    var fullName: String {
        get {
            return nom + " - " + category.name + " - \(poids)g"
        }
    }
}
