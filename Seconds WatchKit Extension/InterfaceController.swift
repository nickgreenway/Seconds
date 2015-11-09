//
//  InterfaceController.swift
//  Seconds WatchKit Extension
//
//  Created by Nick Greenway on 10/9/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var percentLabel: WKInterfaceLabel!
    @IBOutlet var dateLable: WKInterfaceLabel!
    @IBOutlet var timeLabel: WKInterfaceLabel!
    
    var timer: NSTimer?
    let clock = ClockWatch()
    let timeNumberformatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    let timeNumberformatter2 = NSDateFormatter()
    let timeFormatter2 = NSDateFormatter()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        super.awakeWithContext(context)
        timeNumberformatter.dateFormat = "hmmssa"
        timeFormatter.dateFormat = "h:mm:ss:a"
        // Configure interface objects here.
        NSLog("%@ awakeWithContext", self)

    }

    override func willActivate() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick:", userInfo: nil, repeats: true)
         timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updatePercentLabel", userInfo: nil, repeats: true)
        updatetodayLabel()
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)

    }

    override func didDeactivate() {
        NSLog("%@ did deactivate", self)
        timer?.invalidate()
        super.didDeactivate()
    }
    func tick(timer: NSTimer) {
        let now = NSDate()
        let timeString = timeFormatter.stringFromDate(now)
                timeLabel.setTextColor(UIColor.greenColor())
                timeLabel.setText(timeString)
        
      
    }
    func updatePercentLabel() {
        timeNumberformatter2.dateFormat = "A"
        timeFormatter2.dateFormat = "A"
        let now = NSDate()
        let timeString = Double(timeFormatter2.stringFromDate(now))
        let a = Double(4.32e+13) * Double(2)
        let b = Double(timeString!) / a * Double(100000000)
        let x = Double(round(100*b)/100)
        let c = NSNumber(double: x)
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .NoStyle // Change to .DecimalStyle for decimals
        let d = formatter.stringFromNumber(c)
        percentLabel.setTextColor(UIColor.greenColor())
        percentLabel.setText (d! + "%")
    }
    func updatetodayLabel() {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        dateLable.setTextColor(UIColor.greenColor())
        dateLable.setText(formatter.stringFromDate(clock.currentTime))
        
    }

}
