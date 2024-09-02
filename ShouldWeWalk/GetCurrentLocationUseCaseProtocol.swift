//
//  GetCurrentLocationUseCaseProtocol.swift
//  ShouldWeWalk
//
//  Created by Marcos on 2/9/24.
//

import Foundation
import CoreLocation

protocol GetCurrentLocationUseCaseProtocol {
    func getCurrentLocation() -> CLLocation?
}
