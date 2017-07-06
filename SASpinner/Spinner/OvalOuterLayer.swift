//
//  OvalOuterLayer.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/30/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//
//NOT USING RIGHT NOW
import UIKit

// 1
let center = CGPoint(x: 90, y: 90)

// 2
let radius: CGFloat = max(180, 180)

// 3
let arcWidth: CGFloat = 0

// 4
let startAngle: CGFloat = CGFloat(0)
let endAngle: CGFloat = CGFloat(Float.pi / 4)

class OvalOuterLayer: CAShapeLayer {

    override init() {
        super.init()
        fillColor = UIColor.clear.cgColor
        strokeColor =  UIColor.green.cgColor
        lineWidth = 20
        path = archPath.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var ovalPath:UIBezierPath {
        return UIBezierPath(ovalIn:  CGRect(x: 0, y: 12.5, width: 180  , height: 180))
    }
   
    var archPath = UIBezierPath(arcCenter: center,
                            radius: radius/2 - arcWidth/2,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: true)
    
}
