//
//  WeatherRepository.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine

struct WeatherRepository: WeatherServiceProtocol {
    
    var isMocked: Bool
    
    init(isMocked: Bool){
        self.isMocked = isMocked
    }
    
    
    func getWeather(lat: String, long: String) -> AnyPublisher<WeatherDTO, any Error> {
        if(isMocked){
            let mockedData = createWeatherMockDTO()
            return Just(mockedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }else{
           return WeatherService().getWeather(lat: lat, long: long)
        }
    }
    
    
   
}



//Create the mock
extension WeatherRepository {
    
    func createWeatherMockDTO() -> WeatherDTO {
        return WeatherDTO(
                coord: Coord(lon: -122.4194, lat: 37.7749),
                weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")],
                base: "stations",
                main: Main(temp: 15.0, feelsLike: 14.5, tempMin: 14.0, tempMax: 16.0, pressure: 1013, humidity: 72, seaLevel: 1013, grndLevel: 1000),
                visibility: 10000,
                wind: Wind(speed: 1.5, deg: 350, gust: nil),
                rain: nil,
                clouds: Clouds(all: 1),
                dt: 1605182400,
                sys: Sys(type: 1, id: 5122, country: "US", sunrise: 1605166178, sunset: 1605202249),
                timezone: -28800,
                id: 5391959,
                name: "San Francisco",
                cod: 200
            )
    }
}
