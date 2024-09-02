//
//  WeatherServiceProtocol.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine
protocol WeatherServiceProtocol{
    func getWeather(lat: String, long: String) -> AnyPublisher<WeatherDTO, Error>
}
