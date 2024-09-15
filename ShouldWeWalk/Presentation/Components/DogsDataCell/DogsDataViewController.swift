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
    
    static let identifier: String = "DogsDataCell"
    static let estimatedHeight: CGFloat = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.clipsToBounds = true
    }
    
    override func prepareForReuse() {
            super.prepareForReuse()
            minTemperatureLabel.text = nil
            cellImage.image = UIImage(named: "mediumDog")
            maxTemperatureLabel.text = nil
        }
    
    func updateView(photo: String? = nil, minTemperature: String? = nil, maxTemperature: String? = nil) {
        self.cellImage.image = UIImage(named: photo ?? "mediumDog")
        self.minTemperatureLabel.text = minTemperature
        self.maxTemperatureLabel.text = maxTemperature
       }
}
