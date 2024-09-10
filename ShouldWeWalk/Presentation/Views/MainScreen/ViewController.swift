//
//  ViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    

    @IBOutlet weak var containerView: UIView!
    var vm: MainScreenViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
  //      vm?.fetchWeather()


    }
    
    private func setupBindings() {
            vm?.$temperature
                .receive(on: RunLoop.main)
                .sink { [weak self] temperature in
                    guard let self = self else { return }
                    
                    let temperatureViewController = CurrentTemperatureViewController()
                    
                    // Configurar el ViewModel para el CurrentTemperatureViewController
                    let temperatureViewModel = CurrentTemperatureViewModel(
                        temperature: temperature,
                        scale: "ºC",
                        bgColor: UIColor.clear,
                        animationName: ""
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
                    
                    // Notificar al CurrentTemperatureViewController
                    temperatureViewController.didMove(toParent: self)
                }
                .store(in: &cancellables)
        }

}

