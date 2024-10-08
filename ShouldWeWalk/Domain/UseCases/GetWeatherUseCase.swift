//
//  GetWeatherUseCase.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine

final class GetWeatherUseCase: GetWeatherProtocol {
        
    func getWeather(lat: String, long: String) -> AnyPublisher<WeatherDTO, any Error> {
        return WeatherRepository(isMocked: false).getWeather(lat: lat, long: long)
    }
    
    
}
