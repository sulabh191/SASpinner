//
//  OvalLayer.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/29/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class OvalLayer: CAShapeLayer {

    
    let animationDuration: CFTimeInterval = 0.3
    
    override init() {
        super.init()
        fillColor = UIColor.red.cgColor
        path = ovalPathSmall.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ovalPathSmall: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 50.0, y: 50.0, width: 0.0, height: 0.0))
    }
    
    var ovalPathLarge: UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: 2.5, y: 17.5, width: 95.0, height: 95.0))
    }
    
    func expand() {
        
        let expandAnimation = CABasicAnimation(keyPath: "path")
        expandAnimation.fromValue = ovalPathSmall.cgPath
        expandAnimation.toValue = ovalPathLarge.cgPath
        expandAnimation.duration = animationDuration
        expandAnimation.fillMode = kCAFillModeForwards
        //expandAnimation.repeatCount = Float.infinity
        expandAnimation.isRemovedOnCompletion = false
        add(expandAnimation, forKey: nil)
    }
    

}
