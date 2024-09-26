//
//  ViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import Combine
import UIKit

class ViewController: UIViewController {
    @IBOutlet var containerView: UIView!
    var vm: MainScreenViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundView.backgroundColor = UIColor(named: "bgColor")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "bgColor")
        setupBindingsTemperature()
        setupTableView()
    }
    
    private func setupBindingsTemperature() {
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
    
    private func setupTableView() {
        let nib = UINib(nibName: "DogsDataCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DogsDataCell")
        tableView.allowsSelection = false
        tableView.bounces = false
        tableView.rowHeight = 100
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm?.dogsTypes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        DogsDataViewController.estimatedHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DogsDataViewController.identifier, for: indexPath) as? DogsDataViewController else {
            return UITableViewCell()
        }
            
        if let dogType = vm?.loadDogTypeByIndex(index: indexPath.row) {
            cell.updateView(photo: dogType.image, minTemperature: dogType.minTemp, maxTemperature: dogType.maxTemp, riskTemperature: dogType.riskTemp, goodTemperature: dogType.goodTemp)
        }
        cell.backgroundColor = UIColor(named: "bgColor")
        return cell
    }
}
