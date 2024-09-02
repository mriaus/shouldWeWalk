//
//  CurrentTemperatureViewModel.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import UIKit

class CurrentTemperatureViewModel {
    var temperature: String
    var scale: String
    var bgColor: UIColor
    var animationName: String
    
    init(temperature: String, scale: String, bgColor: UIColor, animationName: String) {
        self.temperature = temperature
        self.scale = scale
        self.bgColor = CurrentTemperatureViewModel.setBGColor(condition: Int(temperature) ?? 0)
        self.animationName = CurrentTemperatureViewModel.setAnimationName(condition: Int(temperature) ?? 0)
    }
    
    static func setBGColor(condition: Int) -> UIColor {
        switch condition {
        case 30...:
            return .red
        case 26...29:
            return .orange
        case 22...25:
            return .green
        case 7...21:
            return .blue
        case -4...6:
            return .cyan
        default:
            return .gray
        }
    }
    
    
    static func setAnimationName(condition: Int) -> String {
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
    
    
}
