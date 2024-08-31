//
//  GetWeatherUseCase.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine

final class GetWeatherUseCase: GetWeatherProtocol {
    func getWeather(lat: String, long: String) -> AnyPublisher<WeatherModel, any Error> {
        return WeatherRepository(isMocked: true).getWeather(lat: lat, long: long)
    }
    
    
}
