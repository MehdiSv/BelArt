//
//  Article.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 18/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

class Article: NSManagedObject {

    @NSManaged var nom: String
    @NSManaged var prixAchat: NSNumber
    @NSManaged var prixGr: NSNumber
    @NSManaged var poids: NSNumber
    @NSManaged var category: Category
    @NSManaged var fournisseur: Fournisseur

}
