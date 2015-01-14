//
//  BelArtViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 12/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class BelArtViewController: NSViewController {

    let alertInfo = NSAlert()
    
    let managedObjectContext = (NSApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertInfo.addButtonWithTitle("OK")
        alertInfo.alertStyle = NSAlertStyle.CriticalAlertStyle
    }

    func addInformationAlert(title:String) {
    
        alertInfo.messageText = title
        
        
        alertInfo.runModal()
    }

    func saveContext() {
        
        var error:NSError?
        
        self.managedObjectContext.save(&error)
        
        if error != nil {
            preconditionFailure(error!.description)
        }
    }
    
}
