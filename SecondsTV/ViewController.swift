//
//  ViewController.swift
//  SecondsTV
//
//  Created by Nick Greenway on 10/29/15.
//  Copyright © 2015 Nick Greenway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayPercentLabel: UILabel!
    
    
    let clock = ClockTV()
    var timer: NSTimer?
    let timeNumberformatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
       }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updatetodayLabel()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        dateLabel.textColor = UIColor.greenColor()
        dateLabel.text = formatter.stringFromDate(clock.currentTime)
        
    }
    
}

