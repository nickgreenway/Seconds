//
//  ViewController.swift
//  Seconds
//
//  Created by Nick Greenway on 10/9/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {
    
    
    @IBOutlet weak var dayPercentLabel: UILabel!
    @IBOutlet var background: UIView!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let clock = Clock()
    var timer: NSTimer?
    let timeNumberformatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        timeNumberformatter.dateFormat = "A"
        timeFormatter.dateFormat = "A"
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "updatePercentLabel", userInfo: nil, repeats: true)
    
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateTimeLabel()
        updatetodayLabel()
        updatePercentLabel()
    }
    
    func updateTimeLabel() {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .MediumStyle
        timeLabel.textColor = UIColor.greenColor()
        timeLabel.text = formatter.stringFromDate(clock.currentTime)
    }
    func updatetodayLabel() {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        todayLabel.textColor = UIColor.greenColor()
        todayLabel.text = formatter.stringFromDate(clock.currentTime)
        
    }
    
    
    
    func updatePercentLabel() {
        let now = NSDate()
        let timeString = Double(timeFormatter.stringFromDate(now))
        let a = Double(4.32e+13) * Double(2)
        let b = Double(timeString!) / a * Double(100000000)
        let x = Double(round(100*b)/100)
        let c = NSNumber(double: x)
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .NoStyle
        let d = formatter.stringFromNumber(c)
        dayPercentLabel.textColor = UIColor.greenColor()
        dayPercentLabel.text = (d! + "%")
    }
    
    
override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.All
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        if let timer = self.timer {
            timer.invalidate()
        }
    }
    
}

