import CoreLocation

protocol LocationServiceProtocol: AnyObject {
    var currentLocation: CLLocation? { get }
    func startUpdatingLocation()
    func stopUpdatingLocation()
    var locationUpdated: ((CLLocation) -> Void)? { get set }
    var authorizationStatusChanged: ((CLAuthorizationStatus) -> Void)? { get set }
}

class LocationManager: NSObject, LocationServiceProtocol, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var locationUpdated: ((CLLocation) -> Void)?
    var authorizationStatusChanged: ((CLAuthorizationStatus) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location
            locationUpdated?(location)  // Llama al callback cuando se actualiza la ubicación
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error obteniendo ubicación: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatusChanged?(status)  // Llama al callback cuando cambia la autorización
    }
}
