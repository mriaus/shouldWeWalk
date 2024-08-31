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
    
    var viewModel: CurrentTemperatureViewModel? {
        didSet{
            updateView()
        }
    }
    
    init() {
           super.init(nibName: "CurrentTemperatureView", bundle: nil)
       }

       // Necesario si usas inicialización desde Storyboards o XIB
       required init?(coder: NSCoder) {
           super.init(coder: coder)
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
  
    }
    
    private func updateView() {
        guard let viewModel = viewModel else { return }
        
        // Actualizar la vista con los datos del ViewModel
        temperatureLabel.text = viewModel.temperature
        containerView.backgroundColor = viewModel.bgColor
        // MARK -- 
        animationView = LottieAnimationView(name: viewModel.animationName)
        animationView.animationSpeed = 0.5
        animationView.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        animationView.stop()
    }
}
