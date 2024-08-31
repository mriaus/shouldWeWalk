//
//  Extension+URLResponse.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
