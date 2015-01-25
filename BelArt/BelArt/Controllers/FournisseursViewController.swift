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
