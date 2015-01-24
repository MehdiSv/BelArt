//
//  Fournisseur.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
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
    @NSManaged var achats: NSSet
    @NSManaged var articles: NSSet

}
