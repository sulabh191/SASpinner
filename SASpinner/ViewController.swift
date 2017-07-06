//
//  ViewController.swift
//  SASpinner
//
//  Created by Sulabh Agarwal on 6/29/17.
//  Copyright © 2017 Sulabh Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spinValueLabel: UILabel!

    var spinnerView = SpinnerView(frame: CGRect.zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addSpinnerView()
        spinnerView.addOval()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func spinBuutonAction(_ sender: UIButton) {
        
        spinnerView.callSpinTimer()
    }
    
    func addSpinnerView() {
        let boxSize: CGFloat = 100.0
        spinnerView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        spinnerView.parentFrame = view.frame
        spinnerView.delegate = self
        view.addSubview(spinnerView)
    }
    

}

extension ViewController: spinnerProtocol {
    
    func spinValueAfterCompleteRoatation(value: Float) {
        
        let radianToDegree = Int(value * 180 / .pi)
        spinValueLabel.text = "\(radianToDegree)"
    }
}

