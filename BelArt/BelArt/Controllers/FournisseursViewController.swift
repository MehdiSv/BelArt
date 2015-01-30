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

    var balance:NSNumber {
        get {
            
            if fAC.selectedObjects.count > 0 {
                if let fournisseur = fAC.selectedObjects[0] as? Fournisseur {
                    if fournisseur.nom == "Oromecanica" {
                        let achats = fournisseur.achats
                        var result:Float = 0
                        for achatObject in achats {
                            let achat = achatObject as Achat
                            result = result + achat.total.floatValue - achat.paid.floatValue
                        }
                        println(result)
                        return result
                    }
                }
            }
            return 0
            
        }
    }
}
