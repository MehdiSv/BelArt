//
//  Article.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 05/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Article)
class Article: NSManagedObject {

    @NSManaged var nom: String?
    @NSManaged var poids: NSNumber
    @NSManaged var prixAchat: NSNumber
    @NSManaged var prixGr: NSNumber
    @NSManaged var category: Category
    @NSManaged var fournisseur: Fournisseur
    @NSManaged var vente: Vente?

    class func keyPathsForValuesAffectingPrixTotal() -> NSArray {
        return ["poids", "prixGr"]
    }
    
    class func keyPathsForValuesAffectingPrixGr() -> NSArray {
        return ["prixAchat"]
    }

    class func keyPathsForValuesAffectingFullName() -> NSArray {
        return ["nom", "poids", "category.name"]
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
            if let name = nom {
                if let categoryName = category.name {
                    return categoryName + " - \(poids)g - " + name
                }
            }
            return ""
        }
    }
}
