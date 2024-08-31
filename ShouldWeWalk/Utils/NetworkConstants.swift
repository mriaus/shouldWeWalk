//
//  Constants.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

let server = "https://api.openweathermap.org/data/2.5"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}
let contentType = "application/json"

enum endpoints: String {
    case weather = "/weather"

}
