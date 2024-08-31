//
//  WeatherRepository.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine

struct WeatherRepository: WeatherServiceProtocol {
    
    func GetWheater(lat: String?, long: String?) -> AnyPublisher<WeatherDTO, any Error> {
        fatalError()
    }
    
    
    init(isMocked: Bool){
        
    }
}
