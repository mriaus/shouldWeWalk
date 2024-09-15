//
//  GetDogsDataUseCase.swift
//  ShouldWeWalk
//
//  Created by Marcos on 15/9/24.
//

import Foundation

final class GetDogsDataUseCase: GetDogsDataUseCaseProtocol {
    func getDogs() -> Dogs {
        if let url = Bundle.main.url(forResource: "DogsData", withExtension: "json") {
               do {
                   let data = try Data(contentsOf: url)
                   let decoder = JSONDecoder()
                   let dogData = try decoder.decode(Dogs.self, from: data)
                   return dogData
               } catch {
                   // Manejar errores (por ejemplo, si el archivo no existe o la decodificación falla)
                   print("Error cargando o decodificando el JSON: \(error)")
               }
           }
        print("Return vacio")
           return []
    }
    
        
  
    
    
}
