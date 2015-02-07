//
//  Category.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 06/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Category)
class Category: NSManagedObject {

    @NSManaged var name: String?
    @NSManaged var articles: NSSet

    var sold:Int {
        get {
            var numberOfSold = 0
            for article in articles.allObjects as [Article] {

                if let vente = article.vente {
                    numberOfSold++
                }
            }
            
            return numberOfSold
        }
        
    }
    
    var amountSold:Float {
        get {
            var amountOfSold:Float = 0
            for article in articles.allObjects as [Article] {
                
                if let vente = article.vente {
                    amountOfSold += vente.montant.floatValue
                }
            }
            
            return amountOfSold
        }
    }
    
    var marge:Float {
        get {
            var margeTotal:Float = 0
            for article in articles.allObjects as [Article] {
                
                if let vente = article.vente {
                    margeTotal += vente.marge.floatValue
                }
            }
            
            return margeTotal
        }
        
    }

}
