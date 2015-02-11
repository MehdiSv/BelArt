//
//  StatisticsViewController.swift
//  BelArt
//
//  Created by Mehdi Sqalli on 05/02/15.
//  Copyright (c) 2015 Mehdi Sqalli. All rights reserved.
//

import Cocoa

class StatisticsViewController: BelArtViewController {
    
    @IBOutlet var depensesVersementsAC: NSArrayController!
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
    
    var shopExpenses:Float = 0
    var souadExpenses:Float = 0
    var restExpenses:Float = 0
    
    var depenses:Float = 0
    var versements:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        fromSellDate.dateValue = date
        toSellDate.dateValue = date
        
        calculateSellValues()
        calculateTransactionsValues()
        calculateExpenses()
        calculateDepensesVersements()
    }
    
    func calculateDepensesVersements() {
        println(depensesVersementsAC.arrangedObjects.count)
    }
    
    func calculateExpenses() {
        
        let predicate = NSPredicate(format: "date >= %@ && date <= %@", fromSellDate.dateValue, toSellDate.dateValue)
        
        transactionsAC.filterPredicate = predicate

        shopExpenses = 0
        souadExpenses = 0
        restExpenses = 0
        
        self.willChangeValueForKey("shopExpenses")
        self.willChangeValueForKey("souadExpenses")
        self.willChangeValueForKey("restExpenses")
        self.willChangeValueForKey("depenses")
        self.willChangeValueForKey("versements")
        
        for transaction in transactionsAC.arrangedObjects as [Transaction] {
            
            if transaction.nom != nil {
                if transaction.shopExpense == true {
                    shopExpenses += transaction.montant.floatValue
                }
                else if transaction.shopExpense == false && transaction.nom?.lowercaseString == "souad" {
                    souadExpenses += transaction.montant.floatValue
                } else {
                    restExpenses += transaction.montant.floatValue
                }
            }
            
            println(transaction.isDepense)
            
            if transaction.isDepense == true {
                depenses += transaction.montant.floatValue
            } else {
                versements += transaction.montant.floatValue
            }
        }
        
        depenses -= (shopExpenses + souadExpenses + restExpenses)
        
        println(depenses)
        println(versements)
        
        self.didChangeValueForKey("shopExpenses")
        self.didChangeValueForKey("souadExpenses")
        self.didChangeValueForKey("restExpenses")
        self.didChangeValueForKey("depenses")
        self.didChangeValueForKey("versements")
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

    func setMinutesAndHoursToDate(minutes:Int, hours:Int, date:NSDate) -> NSDate {
        return NSCalendar(calendarIdentifier: NSGregorianCalendar)!.dateBySettingHour(hours, minute: minutes, second: 0, ofDate: date, options: NSCalendarOptions())!
    }
    
    func calculateTransactionsValues() {
        
        let startDate = setMinutesAndHoursToDate(0, hours: 0, date: fromSellDate.dateValue)
        let endDate = setMinutesAndHoursToDate(59, hours: 23, date: toSellDate.dateValue)
        
        let predicate = NSPredicate(format: "(dateEffet >= %@) && (dateEffet <= %@)", startDate, endDate)
        transactionsAC.filterPredicate = predicate
        
        totalEffets = 0
        
        self.willChangeValueForKey("totalEffets")
        
        for transaction in transactionsAC.arrangedObjects as [Transaction] {
            totalEffets += transaction.montant.floatValue
        }

        self.didChangeValueForKey("totalEffets")
    }

    @IBAction func fromSellDateDone(sender: AnyObject) {
        calculateSellValues()
        calculateTransactionsValues()
        calculateExpenses()
        calculateDepensesVersements()
    }
    
    @IBAction func toSellDateDone(sender: AnyObject) {
        calculateSellValues()
        calculateTransactionsValues()
        calculateExpenses()
        calculateDepensesVersements()
    }
    
}
