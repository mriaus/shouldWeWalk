//
//  Utils.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

struct Utils {
    
    func loadLocalJson(filename: String) -> [String: Any]? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                return json
            } catch {
                print("Error al leer el archivo JSON: \(error)")
            }
        } else {
            print("No se encontró el archivo JSON \(filename)")
        }
        return nil
    }
    
}
