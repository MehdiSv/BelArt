//
//  StatisticsViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 05/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class StatisticsViewController: BelArtViewController {
    
    @IBOutlet var transactionsAC: NSArrayController!
    @IBOutlet var ventesAC: NSArrayController!
    @IBOutlet var articlesAC: NSArrayController!
    @IBOutlet weak var fromSellDate: NSDatePicker!
    @IBOutlet weak var toSellDate: NSDatePicker!
    @IBOutlet weak var sellValue: NSTextField!
    
    var totalValueSoldDuringPeriod:Float = 0
    var totalEffectiveValueSoldDuringPeriod:Float = 0
    var totalMargeValueSoldDuringPeriod:Float = 0
    var totalEffets:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        fromSellDate.dateValue = date
        toSellDate.dateValue = date
        
        calculateSellValues()
        calculateTransactionsValues()
    }
    
    func calculateSellValues() {
        
        let predicate = NSPredicate(format: "date >= %@ && date <= %@", fromSellDate.dateValue, toSellDate.dateValue)
        
        ventesAC.filterPredicate = predicate
        
        totalEffectiveValueSoldDuringPeriod = 0
        totalValueSoldDuringPeriod = 0
        totalMargeValueSoldDuringPeriod = 0

        self.willChangeValueForKey("totalMargeValueSoldDuringPeriod")
        self.willChangeValueForKey("totalValueSoldDuringPeriod")
        self.willChangeValueForKey("totalEffectiveValueSoldDuringPeriod")
        
        for vente in ventesAC.arrangedObjects as [Vente] {
            totalValueSoldDuringPeriod += vente.montant.floatValue
            totalEffectiveValueSoldDuringPeriod += vente.paid.floatValue
            totalMargeValueSoldDuringPeriod += vente.marge.floatValue
        }

        self.didChangeValueForKey("totalMargeValueSoldDuringPeriod")
        self.didChangeValueForKey("totalValueSoldDuringPeriod")
        self.didChangeValueForKey("totalEffectiveValueSoldDuringPeriod")
    }

    func calculateTransactionsValues() {
        let predicate = NSPredicate(format: "dateEffet >= %@ && dateEffet <= %@", fromSellDate.dateValue, toSellDate.dateValue)
        
        transactionsAC.filterPredicate = predicate
        
        totalEffets = 0
        
        self.willChangeValueForKey("totalEffets")
        
        for transaction in transactionsAC.arrangedObjects as [Transaction] {
            totalEffets += transaction.montant.floatValue
            println(transaction.moyen.moyen)
        }

        self.didChangeValueForKey("totalEffets")
    }

    @IBAction func fromSellDateDone(sender: AnyObject) {
        calculateSellValues()
        calculateTransactionsValues()
    }
    
    @IBAction func toSellDateDone(sender: AnyObject) {
        calculateSellValues()
        calculateTransactionsValues()
    }
    
}
