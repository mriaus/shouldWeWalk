//
//  getEnvData.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation
import SwiftDotenv

final class GetEnvData {

    static let shared = GetEnvData()
    
    private init() {
        do {
            try Dotenv.configure()
        } catch {
            print("Error al configurar Dotenv: \(error)")
        }
    }

    var apiKey: String? {
        return Dotenv["API_KEY"]?.stringValue
    }
}
