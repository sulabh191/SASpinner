//
//  TriangleLayer.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/29/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class TriangleLayer: CAShapeLayer {

    
    let innerPadding: CGFloat = 30.0
    
    override init() {
        super.init()
        fillColor = UIColor.red.cgColor
        strokeColor = UIColor.red.cgColor
        lineWidth = 7.0
        lineCap = kCALineCapRound
        lineJoin = kCALineJoinRound
        path = trianglePathSmall.cgPath
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var trianglePathSmall: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0 + innerPadding, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLine(to: CGPoint(x: 95.0 - innerPadding, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    var trianglePathLeftExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLine(to: CGPoint(x: 85.0 - innerPadding, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    var trianglePathRightExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 5.0, y: 95.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 12.5 + innerPadding))
        trianglePath.addLine(to: CGPoint(x: 85.0, y: 95.0))
        trianglePath.close()
        return trianglePath
    }
    
    var trianglePathTopExtension: UIBezierPath {
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 15.0, y: 85.0))
        trianglePath.addLine(to: CGPoint(x: 50.0, y: 10.5))
        trianglePath.addLine(to: CGPoint(x: 85.0, y: 85.0))
        trianglePath.close()
        return trianglePath
    }
    
    func animate() {
        

        let triangleAnimationTop = CABasicAnimation(keyPath: "path")
        triangleAnimationTop.fromValue = trianglePathRightExtension.cgPath
        triangleAnimationTop.toValue = trianglePathTopExtension.cgPath
        triangleAnimationTop.beginTime = 0.0
        triangleAnimationTop.duration = 0.20
        
        let triangleAnimationGroup = CAAnimationGroup()
        //triangleAnimationGroup.animations = [triangleAnimationLeft, triangleAnimationRight,triangleAnimationTop]
        triangleAnimationGroup.animations = [triangleAnimationTop]
        triangleAnimationGroup.duration = triangleAnimationTop.beginTime + triangleAnimationTop.duration
        triangleAnimationGroup.fillMode = kCAFillModeForwards
        triangleAnimationGroup.isRemovedOnCompletion = false
        add(triangleAnimationGroup, forKey: nil)
    }
}
