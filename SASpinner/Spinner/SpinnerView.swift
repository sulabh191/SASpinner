//
//  SpinnerView.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/29/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

protocol spinnerProtocol : class {
    
    
    /// delegate func to fetch final spin rotation value , once rotaion is completed
    ///
    /// - Parameter value: Value in Radians
    func spinValueAfterCompleteRoatation(value:Float)
}

//Spin Constants
let incrementValue = 0.5 //This increment spin duration after each roation of circle
let minimumTimeForRotation = 3.5 //Minimum Duration for Circle to rotate

class SpinnerView: UIView {

    let ovalLayer = OvalLayer()
    let triangleLayer = TriangleLayer()
    
    var parentFrame :CGRect = CGRect.zero
    var spinTimer:RepeatingTimerManager?
    
    var spinRepeatCount = 1
    var spinRotationDuration = 0.5
    var randomNumber:Float = 0.0
    
    weak var delegate : spinnerProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(SpinnerView.addTriangleLayer), userInfo: nil, repeats: false)
        
    }
    
    func addTriangleLayer() {
        layer.addSublayer(triangleLayer)
        
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(SpinnerView.drawAnimatedTriangle), userInfo: nil, repeats: false)
        
    }
    
    func drawAnimatedTriangle() {
        triangleLayer.animate()
        
       //callSpinTimer(time: 0.5)

    }
    
    func callSpinTimer(time:Float = 0.5,rotationNum:Float = Float.pi * 2.0) {
        
        randomNumber = rotationNum
         self.spinTimer = RepeatingTimerManager(target: self, selector: #selector(SpinnerView.spinAndTransForm), frequency: TimeInterval(time))
       
    }
    
    func spinAndTransForm() {
       
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        
        rotationAnimation.toValue = CGFloat(randomNumber)
        //rotationAnimation.beginTime = 0.0
        rotationAnimation.duration = spinRotationDuration
        rotationAnimation.isRemovedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        rotationAnimation.repeatCount = Float(spinRepeatCount)

        
        layer.add(rotationAnimation, forKey: nil)
        
        continueSpin()
    }
    
    func continueSpin() {
        
        spinRotationDuration += incrementValue
        print(spinRotationDuration)
        if spinRotationDuration <= minimumTimeForRotation {
            callSpinTimer(time: Float(spinRotationDuration - incrementValue))
        } else if spinRotationDuration == (minimumTimeForRotation + incrementValue) {
            
            randomNumber = Float(arc4random_uniform(5)) + Float(drand48())

            print("randomNumber num:\(randomNumber)")
            callSpinTimer(time: Float(spinRotationDuration - incrementValue),rotationNum: randomNumber)
            
        } else {
            
            Timer.scheduledTimer(timeInterval: spinRotationDuration, target: self, selector: #selector(SpinnerView.sendSpinValue), userInfo: nil, repeats: false)
            spinTimer?.invalidateTimer()
            spinRotationDuration = incrementValue
        }

    }
    
    
    func sendSpinValue() {
        //Call Delegate
          delegate?.spinValueAfterCompleteRoatation(value: randomNumber)
    }
}
