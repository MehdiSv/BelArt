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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var balance:NSNumber {
        get {
            
            if fAC.selectedObjects.count > 0 {
                if let fournisseur = fAC.selectedObjects[0] as? Fournisseur {
                    let achats = fournisseur.achats
                    for achat in achats {
                        let tutu = achat as Achat
                        println(tutu.total)
                    }
                }
            }
            return 0
            
        }
    }
}
