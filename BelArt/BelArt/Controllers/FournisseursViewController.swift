//
//  FournisseursViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 06/01/2015.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class FournisseursViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate  {

    @IBOutlet weak var tableView: NSTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func numberOfRowsInTableView(aTableView: NSTableView!) -> Int
    {
        return 3
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn: NSTableColumn, row: Int) -> NSView
    {
        var cell = tableView.makeViewWithIdentifier("FournisseurCell", owner: self) as NSTableCellView
        cell.textField!.stringValue = "Hey, this is a cell"
        return cell;
    }
    
}
