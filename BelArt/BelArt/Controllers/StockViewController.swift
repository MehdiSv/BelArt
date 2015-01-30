//
//  StockViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 14/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class StockViewController: BelArtViewController {
    
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var articleAC: BelArtArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        for column in tableView.tableColumns {
            (column as NSTableColumn).resizeToFitContents()
        }
        
    }
}

