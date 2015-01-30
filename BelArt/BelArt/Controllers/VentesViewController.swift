//
//  VentesViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 24/01/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class VentesViewController: BelArtViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var articlesAC: NSArrayController!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let sd = NSSortDescriptor(key: "fullName", ascending: true)
        articlesAC.sortDescriptors = [sd]
        
    }
    
}
