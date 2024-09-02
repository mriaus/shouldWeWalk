//
//  ViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    

    @IBOutlet weak var temperatureTest: UILabel!
    @IBOutlet weak var containerView: UIView!
    var vm: MainScreenViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: pass the Repository
        let getWeatherUseCase = GetWeatherUseCase()
        //vm = MainScreenViewModel(getWeatherUseCase: getWeatherUseCase)
        
        setupBindings()
        vm?.fetchWeather(lat: "40.4168", long: "-3.7038")


    }
    
    private func setupBindings() {
            vm?.$temperature
                .receive(on: RunLoop.main)
                .sink { [weak self] temperature in
                    guard let self = self else { return }
                    
                    // Configurar y presentar el CurrentTemperatureViewController
                    let temperatureViewController = CurrentTemperatureViewController()
                    
                    // Configurar el ViewModel para el CurrentTemperatureViewController
                    print("Temperature main vc -> \(temperature)")
                    let temperatureViewModel = CurrentTemperatureViewModel(
                        temperature: temperature,
                        scale: "ºC", // o lo que sea necesario
                        bgColor: UIColor.clear, // Establecer el color por defecto
                        animationName: "" // Nombre de animación por defecto
                    )
                    
                    temperatureViewController.viewModel = temperatureViewModel
                    
                    self.addChild(temperatureViewController)
                                   temperatureViewController.view.frame = self.containerView.bounds
                                   self.containerView.addSubview(temperatureViewController.view)
                                   
                                   temperatureViewController.view.translatesAutoresizingMaskIntoConstraints = false
                                   
                                   NSLayoutConstraint.activate([
                                       temperatureViewController.view.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
                                       temperatureViewController.view.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
                                       temperatureViewController.view.topAnchor.constraint(equalTo: self.containerView.topAnchor),
                                       temperatureViewController.view.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor)
                                   ])
                    
                    // Notificar al CurrentTemperatureViewController que fue agregado como hijo
                    temperatureViewController.didMove(toParent: self)
                }
                .store(in: &cancellables)
        }

}

