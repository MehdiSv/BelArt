//
//  DepensesViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 05/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class DepensesViewController: BelArtViewController {
    
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var transactionsAC: BelArtArrayController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let predicate = NSPredicate(format: "nom != nil")
        
        transactionsAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
        
        transactionsAC.fetchPredicate = predicate
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        for column in tableView.tableColumns {
            (column as NSTableColumn).resizeToFitContents()
        }
        
    }
}
