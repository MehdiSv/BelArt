//
//  Vente.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Foundation
import CoreData

@objc(Vente)
class Vente: NSManagedObject {

    @NSManaged var montant: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var client: Client
    @NSManaged var article: Article
    @NSManaged var transactions: NSSet

}
