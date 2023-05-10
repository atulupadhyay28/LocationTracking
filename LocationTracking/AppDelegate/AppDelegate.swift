//
//  AppDelegate.swift
//  LocationTracking
//
//  Created by Atul Upadhyay on 18/04/23.
//

import UIKit
import CoreData
import CoreLocation
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var userLocationLat = Double()
    var userLocationLon = Double()
    var locationManager = CLLocationManager()
    var userLocation = CLLocationCoordinate2D()
    var arrayNearByUser = NSMutableArray()
 
     // activity Loading view
 
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared().isEnabled = true
        Thread.sleep(forTimeInterval: 2.0)
        locationManager.delegate = self
        LocationManager.sharedManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.allowsBackgroundLocationUpdates = true
        //locationManager.showsBackgroundLocationIndicator = true
       // locationManager.startMonitoringSignificantLocationChanges()
        print("Database Path:- \(String(describing: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first))")
        
        return true
    }
  
    
    func applicationWillTerminate(_ application: UIApplication) {
        locationManager.showsBackgroundLocationIndicator = true
       locationManager.startMonitoringSignificantLocationChanges()
    }
    
   
    
  
    
}

