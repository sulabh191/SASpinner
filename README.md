# SASpinner
* This is like a roulette animation that will make OvalShape Circle spins and gradually stops

 Usage : 
* Step 1: Add SpinnerView to your Controller :
 ````let boxSize: CGFloat = 100.0
        spinnerView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2,
                                  y: view.bounds.height / 2 - boxSize / 2,
                                  width: boxSize,
                                  height: boxSize)
        spinnerView.parentFrame = view.frame
        spinnerView.delegate = self
        view.addSubview(spinnerView)  
  ````      

* Step 2:Call Function callSpinTimer() to start spin  (spinnerView.callSpinTimer()

* Step 3: Implement spinnerProtocol delegate function

```` func spinValueAfterCompleteRoatation(value: Float) {
        //Value is in radian , 
        let radianToDegree = Int(value * 180 / .pi)
        spinValueLabel.text = "\(radianToDegree)"
  }
````  
Learn More About It On https://suagisreal.wordpress.com/roulette-like-wheel-animation/
