//
//  GetCurrentLocationUseCase.swift
//  ShouldWeWalk
//
//  Created by Marcos on 2/9/24.
//

import Foundation
import CoreLocation

protocol LocationUseCase {
    var locationUpdated: ((CLLocation) -> Void)? { get set }
    var authorizationStatusChanged: ((CLAuthorizationStatus) -> Void)? { get set }
    func getCurrentLocation() -> CLLocation?
    func startUpdatingLocation()
    func stopUpdatingLocation()
}

class GetCurrentLocationUseCase: LocationUseCase {
    private let locationService: LocationServiceProtocol

    var locationUpdated: ((CLLocation) -> Void)? {
        get { locationService.locationUpdated }
        set { locationService.locationUpdated = newValue }
    }
    
    var authorizationStatusChanged: ((CLAuthorizationStatus) -> Void)? {
        get { locationService.authorizationStatusChanged }
        set { locationService.authorizationStatusChanged = newValue }
    }

    init(locationService: LocationServiceProtocol) {
        self.locationService = locationService
    }

    func getCurrentLocation() -> CLLocation? {
        return locationService.currentLocation
    }
    
    func startUpdatingLocation() {
        locationService.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationService.stopUpdatingLocation()
    }
}

