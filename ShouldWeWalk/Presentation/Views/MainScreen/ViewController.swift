//
//  ViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 30/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          
          // Presenta el CurrentTemperatureViewController cuando la vista ya está en la jerarquía
          let temperatureViewController = CurrentTemperatureViewController()
       
        temperatureViewController.view.frame = containerView.bounds
                containerView.addSubview(temperatureViewController.view)
        
        temperatureViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
               temperatureViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
               temperatureViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
               temperatureViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
               temperatureViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
           ])

           // Notificar al CurrentTemperatureViewController que fue agregado como hijo
           temperatureViewController.didMove(toParent: self)
      }


}

