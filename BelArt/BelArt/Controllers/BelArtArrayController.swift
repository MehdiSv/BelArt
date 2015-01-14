//
//  BelArtArrayController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 14/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class BelArtArrayController: NSArrayController {

    override func remove(sender: AnyObject?) {
        
        let alert = NSAlert()
        alert.addButtonWithTitle("Supprimer")
        alert.addButtonWithTitle("Annuler")
        
        alert.messageText = "Êtes-vous sur de vouloir supprimer cet élément ?"
        alert.informativeText = "Cet opération est définitive!"
        
        alert.alertStyle = NSAlertStyle.WarningAlertStyle
        
        if alert.runModal() == NSAlertFirstButtonReturn {
            
            super.remove(self)
        }
    }

    
}
