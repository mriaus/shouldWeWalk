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
    var bgColor: UIColor
    var animationName: String
    
    init(temperature: String, scale: String, bgColor: UIColor, animationName: String) {
        self.temperature = temperature
        self.scale = scale
        self.bgColor = CurrentTemperatureViewModel.setBGColor(condition: Double(temperature) ?? 0.0)
        self.animationName = CurrentTemperatureViewModel.setAnimationName(condition: Double(temperature) ?? 0.0)
    }
    
    static func setBGColor(condition: Double) -> UIColor {
        switch condition {
        case 30...:
            return .red
        case 26...29:
            return .orange
        case 22...25:
            return .orange
        case 7...21:
            return .green
        case -4...6:
            return .cyan
        default:
            return .cyan
        }
    }
    
    
    static func setAnimationName(condition: Double) -> String {
        switch condition {
        case 30...:
            return "heatAnimationBG"
        case 26...29:
            return "heatAnimationBG"
        case 22...25:
            return "heatAnimationBG"
        case 7...21:
            return "heatAnimationBG"
        case -4...6:
            return "heatAnimationBG"
        default:
            return "heatAnimationBG"
        }
    }
    
    private func updateProperties() {
        guard let temp = Double(temperature) else { return }
        self.bgColor = CurrentTemperatureViewModel.setBGColor(condition: temp)
        self.animationName = CurrentTemperatureViewModel.setAnimationName(condition: temp)
    }
    
}
