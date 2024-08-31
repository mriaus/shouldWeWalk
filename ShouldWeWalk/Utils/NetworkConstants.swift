//
//  Constants.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

public let SERVER = "https://api.openweathermap.org/data/2.5"

struct HTTPMETHODS {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}
let CONTENTTYPE = "application/json"

enum ENDPOINTS: String {
    case weather = "/weather"

}
