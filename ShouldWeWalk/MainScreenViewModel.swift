//
//  MainScreenViewModel.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine
import CoreLocation

class MainScreenViewModel {
    
    @Published var temperature: String = ""
    @Published var isLoading: Bool = true
    @Published var isLocationServiceEnabled: Bool = false

    
    private let getWeatherUseCase: GetWeatherUseCase
    private let locationUseCase: GetCurrentLocationUseCase
    private var cancellables = Set<AnyCancellable>()
    
    init(getWeatherUseCase: GetWeatherUseCase, locationUseCase: GetCurrentLocationUseCase) {
        self.getWeatherUseCase = getWeatherUseCase
        self.locationUseCase = locationUseCase
        print("Entra0")

        setupLocationService()
    }
    
    func setupLocationService() {
          locationUseCase.authorizationStatusChanged = { [weak self] status in
              self?.handleAuthorizationStatus(status)
          }

          locationUseCase.locationUpdated = { [weak self] location in
              self?.fetchWeather(with: location)
          }

          // Verifica el estado de la autorización al iniciar
          handleAuthorizationStatus(CLLocationManager.authorizationStatus())
      }

      private func handleAuthorizationStatus(_ status: CLAuthorizationStatus) {
          switch status {
          case .authorizedWhenInUse, .authorizedAlways:
              print("Ubicación autorizada")
              self.isLocationServiceEnabled = true
              locationUseCase.startUpdatingLocation()
          case .denied, .restricted:
              print("Ubicación denegada o restringida")
              self.isLocationServiceEnabled = false
          case .notDetermined:
              print("Ubicación no determinada")
              self.isLocationServiceEnabled = false
          @unknown default:
              break
          }
      }
      
      func fetchWeather(with location: CLLocation) {
          isLoading = true
          let lat = "\(location.coordinate.latitude)"
          let long = "\(location.coordinate.longitude)"
          print("lat -> \(location.coordinate.latitude)")
          print("lon -> \(location.coordinate.longitude)")
          getWeatherUseCase.getWeather(lat: lat, long: long)
              .sink(receiveCompletion: { [weak self] completion in
                  guard let self = self else { return }
                  self.isLoading = false
                  if case let .failure(error) = completion {
                      print("Peta esto \(error.localizedDescription)")
                      print("Error completo: \(error)")
                  }
              }, receiveValue: { [weak self] weatherDTO in
                  print("temp -> \(String(describing: self?.temperature))")

                  self?.temperature = self?.transformWeatherToTemperature(weatherDTO: weatherDTO) ?? ""
                  print("temp -> \(String(describing: self?.temperature))")
              })
              .store(in: &cancellables)
      }
    
    
    
    private func transformWeatherToTemperature(weatherDTO: WeatherDTO) -> String{
        print("WeatherDTO -> \(weatherDTO)")
        return String(weatherDTO.main.temp)
        
    }
}
