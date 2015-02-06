//
//  FournisseursViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 06/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class FournisseursViewController: BelArtViewController  {
    
    @IBOutlet var fAC: BelArtArrayController!
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        for column in tableView.tableColumns {
            (column as NSTableColumn).resizeToFitContents()
        }
        
    }
}
