//
//  RepeatingTimerManager.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/29/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class RepeatingTimerManager: NSObject {

    var target:NSObject!
    var selectorToRun: Selector!
    var timer:Timer!
    
    init(target: NSObject, selector: Selector, frequency: TimeInterval) {
        super.init()
        
        self.target = target
        self.selectorToRun = selector
        self.timer = Timer.scheduledTimer(timeInterval: frequency, target: self, selector: #selector(RepeatingTimerManager.runTimerSelector), userInfo: nil, repeats: false)
    }
    
    
    func invalidateTimer() {
        timer.invalidate()
        self.timer = nil
        self.target = nil
        self.selectorToRun = nil
    }
    
    func runTimerSelector() {
        self.target.perform(self.selectorToRun)
    }
    
}
