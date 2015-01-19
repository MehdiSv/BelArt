//
//  Client.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 19/01/15.
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

}
