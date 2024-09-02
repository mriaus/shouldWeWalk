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
            // Usa la ruta relativa si el archivo .env está en la raíz del proyecto
            let path = Bundle.main.path(forResource: ".env", ofType: nil) ?? ""
            try Dotenv.configure(atPath: path)
            print("Dotenv configurado correctamente")
        } catch {
            print("Error al configurar Dotenv: \(error)")
        }

    }

    var apiKey: String? {
        return Dotenv["API_KEY"]?.stringValue
    }
}
