//
//  WeatherDTO.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome3 = try Welcome3(json)

import Foundation

// MARK: - Welcome3
struct WeatherDTO {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let rain: Rain
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds {
    let all: Int
}

// MARK: - Coord
struct Coord {
    let lon, lat: Double
}

// MARK: - Main
struct Main {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int
}

// MARK: - Rain
struct Rain {
    let the1H: Double
}

// MARK: - Sys
struct Sys {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather {
    let id: Int
    let main, weatherDescription, icon: String
}

// MARK: - Wind
struct Wind {
    let speed: Double
    let deg: Int
    let gust: Double
}
