//
//  CurrentTempretarueViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import UIKit
import Lottie

class CurrentTemperatureViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var teperatureTypeLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    init() {
           super.init(nibName: "CurrentTemperatureView", bundle: nil)
       }

       // Necesario si usas inicialización desde Storyboards o XIB
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor = .orange
        // 1. Set animation content mode
        animationView.contentMode = .scaleAspectFit
        
        // 2. Set animation loop mode
        animationView.loopMode = .loop
        
        // 3. Adjust animation speed
        animationView.animationSpeed = 0.5
        
        // 4. Play animation
        animationView.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        animationView.stop()
    }
}
