//
//  WeatherServiceProtocol.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

protocol WeatherServiceProtocol{
    func signIn(userName: String?, password: String?) -> AnyPublisher<LoginResponse, Error>
}
