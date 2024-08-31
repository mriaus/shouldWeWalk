//
//  WeatherService.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import Combine

struct WeatherService {
        
    func getWeather(lat: String, long: String) -> AnyPublisher<WeatherDTO, any Error> {
        
        // Obtener la API key desde GetEnvData
        guard let apiKey = GetEnvData.shared.apiKey else {
            fatalError("API Key no encontrada en el archivo .env")
        }
        
        
        var components = URLComponents(string: "\(SERVER)\(ENDPOINTS.weather.rawValue)")
        components?.queryItems = [
                URLQueryItem(name: "lat", value: lat),
                URLQueryItem(name: "lon", value: long),
                URLQueryItem(name: "appid", value: apiKey)
        ]
        
        
        guard let url = components?.url else {
                  fatalError("URL inválida")
              }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = HTTPMETHODS.get
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return URLSession.shared.dataTaskPublisher(for: request)
                    .tryMap { data, response in
                        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                    .decode(type: WeatherDTO.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
    }
}

