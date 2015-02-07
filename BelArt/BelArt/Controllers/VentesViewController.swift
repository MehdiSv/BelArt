//
//  VentesViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class VentesViewController: BelArtViewController {

    @IBOutlet var transactionsAC: BelArtArrayController!
    @IBOutlet weak var tableViewTransactions: NSTableView!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var articlesAC: NSArrayController!
    @IBOutlet var ventesAC: BelArtArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        ventesAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
        transactionsAC.addObserver(self, forKeyPath: "arrangedObjects", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func viewWillAppear() {
        let sd = NSSortDescriptor(key: "fullName", ascending: true)
        articlesAC.sortDescriptors = [sd]
        
        articlesAC.rearrangeObjects()
    }
 
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        if object as BelArtArrayController == ventesAC {
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
