//
//  CurrentTempretarueViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import Lottie
import UIKit

class CurrentTemperatureViewController: UIViewController {
    @IBOutlet var animationView: LottieAnimationView!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var teperatureTypeLabel: UILabel!
    @IBOutlet var bgImageView: UIImageView!
    
    @IBOutlet var containerView: UIView!
    
    var viewModel: CurrentTemperatureViewModel? {
        didSet {
            // Actualizar la vista si la vista ya ha sido cargada
            if isViewLoaded {
                updateView()
            }
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
        bgImageView.image = viewModel.bgImage
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        temperatureLabel.animateNumberChange(from: Double(temperatureLabel.text ?? "10.0") ?? 0.0, to: Double(viewModel.temperature) ?? 1.0, duration: 1)
        teperatureTypeLabel.text = viewModel.scale

        // Asegúrate de que `animationView` esté correctamente inicializado
        if !viewModel.animationName.isEmpty {
            // Asegúrate de que animationView esté inicializado
            if animationView == nil {
                animationView = LottieAnimationView(name: viewModel.animationName)
            } else {
                animationView.animation = LottieAnimation.named(viewModel.animationName)
            }
            animationView.animationSpeed = 0.7
            animationView.loopMode = .playOnce
            animationView.backgroundColor = .clear
            animationView.play()

        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        animationView.stop()
    }
}
