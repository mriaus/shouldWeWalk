//
//  DogsDataViewController.swift
//  ShouldWeWalk
//
//  Created by Marcos on 15/9/24.
//

import Foundation
import UIKit

class DogsDataViewController: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var goodTemperatureLabel: UILabel!
    @IBOutlet weak var riskTemperatureLabel: UILabel!
    static let identifier: String = "DogsDataCell"
    static let estimatedHeight: CGFloat = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.clipsToBounds = true
        minTemperatureLabel.textColor = UIColor(named: "customBlue")
        maxTemperatureLabel.textColor = UIColor(named: "customRed")
        goodTemperatureLabel.textColor = UIColor(named: "customGreen")
        riskTemperatureLabel.textColor = UIColor(named: "customOrange")

    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            minTemperatureLabel.text = nil
            cellImage.image = UIImage(named: "mediumDog")
            maxTemperatureLabel.text = nil
            goodTemperatureLabel.text = nil
            riskTemperatureLabel.text = nil

       
        }
    
    func updateView(photo: String? = nil, minTemperature: String? = nil, maxTemperature: String? = nil, riskTemperature: String? = nil, goodTemperature: String? = nil) {
        self.cellImage.image = UIImage(named: photo ?? "mediumDog")
        self.minTemperatureLabel.text = minTemperature
        self.maxTemperatureLabel.text = maxTemperature
        self.riskTemperatureLabel.text = riskTemperature
        self.goodTemperatureLabel.text = goodTemperature

       }
}
