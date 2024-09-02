//
//  MainScreenViewModel.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine


class MainScreenViewModel {
    
    @Published var temperature: String = ""
    @Published var isLoading: Bool = true
    
    private let getWeatherUseCase: GetWeatherUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(getWeatherUseCase: GetWeatherUseCase) {
        self.getWeatherUseCase = getWeatherUseCase
    }
    
    func fetchWeather(lat: String, long: String) {
        isLoading = true
        
        getWeatherUseCase.getWeather(lat: lat, long: long)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case let .failure(error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] weatherDTO in
                print("self?.transformWeatherToTemperature(weatherDTO: weatherDTO) -> \(String(describing: self?.transformWeatherToTemperature(weatherDTO: weatherDTO)))")
                self?.temperature = self?.transformWeatherToTemperature(weatherDTO: weatherDTO) ?? ""
            })
            .store(in: &cancellables)
    }
    
    
    
    private func transformWeatherToTemperature(weatherDTO: WeatherDTO) -> String{
        return weatherDTO.main.temp.description
        
    }
}
