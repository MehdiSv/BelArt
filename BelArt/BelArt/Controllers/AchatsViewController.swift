//
//  AchatsViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 19/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class AchatsViewController: BelArtViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var achatsAC: BelArtArrayController!
    @IBOutlet var transactionsAC: BelArtArrayController!
    @IBOutlet weak var tableViewTransactions: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        achatsAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
        transactionsAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        if object as BelArtArrayController == achatsAC {
            for column in tableView.tableColumns {
                (column as NSTableColumn).resizeToFitContents()
            }
        }
        else {
            for column in tableViewTransactions.tableColumns {
                (column as NSTableColumn).resizeToFitContents()
            }
        }
    }

}
