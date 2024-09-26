//
//  CurrentTemperatureViewModel.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import UIKit

class CurrentTemperatureViewModel {
    var temperature: String {
            didSet {
                updateProperties()
            }
        }
    var scale: String
    var animationName: String
    var bgImage: UIImage
    
    init(temperature: String, scale: String, bgColor: UIColor, animationName: String) {
        self.temperature = temperature
        self.scale = scale
        self.animationName = CurrentTemperatureViewModel.setAnimationName(condition: Double(temperature) ?? 0.0)
        self.bgImage = CurrentTemperatureViewModel.setBGImage(condition: Double(temperature) ?? 0.0)
    }
    

    
    static func setBGImage(condition: Double) -> UIImage {
        switch condition {
        case 30...:
            return UIImage(named: "bgHeat")!
        case 26...29:
            return UIImage(named: "bgHeat")!
        case 22...26:
            return UIImage(named: "bgImageDefault")!
        case 7...22:
            return UIImage(named: "bgImageDefault")!
        case -30...6:
            return UIImage(named: "bgImageWinter")!
        default:
            return UIImage(named: "bgImageDefault")!
        }
    }
    
    
    static func setAnimationName(condition: Double) -> String {
        switch condition {
        case 30...:
            return "Bolita"
        case 26...29:
            return "Bolita"
        case 22...25:
            return "heatAnimationBG"
        case 7...21:
            return "Bolita"
        case -4...6:
            return "Bolita"
        default:
            return "Bolita"
        }
    }
    
    private func updateProperties() {
        guard let temp = Double(temperature) else { return }
        self.animationName = CurrentTemperatureViewModel.setAnimationName(condition: temp)
        self.bgImage = CurrentTemperatureViewModel.setBGImage(condition: temp)
    }
    
}
