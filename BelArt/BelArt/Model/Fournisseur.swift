//
//  Fournisseur.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 12/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

class Fournisseur: NSManagedObject {

    @NSManaged var prenom: String
    @NSManaged var nom: String
    @NSManaged var email: String
    @NSManaged var tel: String

}
