//
//  LocationManager.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 18/04/23.
//

import UIKit
import CoreLocation


class LocationManager:   NSObject {
    
    static let sharedManager = LocationManager()
    var userLatitude : Double! = 0
    var userLongitude : Double! = 0
    var location : CLLocation!
    var prevlocation : CLLocationCoordinate2D!
    var center1:CLLocationCoordinate2D!
    var Dashboard = DashboardVC()
    var locationTriggerTimer = Timer()
    
    
    
    
        var locationManager:CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kCLHeadingFilterNone
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.startMonitoringSignificantLocationChanges()
        // locationManager.distanceFilter = 10
        return locationManager
    }()
    
    @objc func startUpdatingLocation()  {
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation()  {
        locationManager.stopUpdatingLocation()
    }
    
    func getDistanceOf(dLatitude:Double, dLongitude:Double, inMiles:Bool) -> Double {
        var distance = 0.0
        let sourceCoordinate = CLLocation(latitude: userLatitude, longitude: userLongitude)
        let destinationCoordinate = CLLocation(latitude: dLatitude, longitude: dLongitude)
        distance = destinationCoordinate.distance(from: sourceCoordinate)
        if inMiles {
            distance = distance/1609
        }
//        print("distance...\(distance)")
        return distance
    }
    
    func startTimer() {
        locationTriggerTimer = Timer.scheduledTimer(timeInterval: 300.0, target: locationManager, selector: #selector(startUpdatingLocation), userInfo: nil, repeats: false)
    }
    
}



extension LocationManager:CLLocationManagerDelegate {
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        
        let locValue:CLLocationCoordinate2D = locationManager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
        getAddressFromLatLon(latitude: locValue.latitude, longitude: locValue.longitude)
        getDistanceOf(dLatitude: locValue.latitude, dLongitude: locValue.longitude, inMiles: true)
        userLatitude = locValue.latitude
        userLongitude = locValue.longitude
        
       
      
        if let location = locations.last {
            userLatitude = location.coordinate.latitude
            userLongitude = location.coordinate.longitude
            var lastTime = TimeInterval(UserDefaults.standard.double(forKey: "last_location_time"))
            let currentTime = Date().timeIntervalSince1970

            let difference = Int(currentTime - lastTime)
            if lastTime == 0 || difference >= 300 {
                startTimer()
                UserDefaults.standard.set(currentTime, forKey: "last_location_time")
                lastTime = currentTime
//                if let userId = User.userId {
//                    if userId != "" {
////                        updateLocationAfterEveryFiveMinutes()
//                    }
//                }
                let dictionary = NSMutableDictionary()
                dictionary.setValue(location.coordinate.latitude, forKey: "latitude")
                dictionary.setValue(location.coordinate.longitude, forKey: "longitude")
                NearByUserManager.insertNearByUserIntoTable(dictionary)

            }
        }
    }
}

func getAddressFromLatLon(latitude: Double, longitude: Double) {
    let location = CLLocation(latitude: latitude, longitude: longitude)
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
        if error != nil {
            print("Error getting address: \(error!.localizedDescription)")
        } else {
            if let placemark = placemarks?.first {
                let address = "\(placemark.thoroughfare ?? ""), \(placemark.subLocality ?? ""), \(placemark.administrativeArea ?? "") \(placemark.postalCode ?? ""), \(placemark.country ?? "")"
                print("Address: \(address)")
            }
        }
    }
}


//func sendCurrentlocation(locValue:CLLocationCoordinate2D)
//{
//    var parameters = [String:Any]()
//    parameters["latitude"] = String(locValue.latitude)
//    parameters["longitude"] = String(locValue.longitude)
//    parameters["remote_deviceId"] = UIDevice.current.identifierForVendor!.uuidString
//
//    print(parameters)
//    APIClient.locationApi(parameters: parameters) { (result) in
//
//        switch result {
//        case .success(_): break
//
//        case .failure(let error):
//            print(error.localizedDescription)
//
//        }
//    }
//}










