//
//  Dog.swift
//  ShouldWeWalk
//
//  Created by Marcos on 31/8/24.
//

import Foundation

public typealias Dogs = [Dog]

public struct Dog: Decodable {
    let id: String
    let type: String
    let maxTemp: String
    let minTemp: String
    let moderateTemp: String
    let riskTemp: String
    let goodTemp: String
    let lowTemp: String
    let image: String
}


