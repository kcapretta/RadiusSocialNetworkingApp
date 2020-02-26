//
//  GeofenceLocations.swift
//  Radius
//
//  Created by Kassandra Capretta on 1/24/20.
//  Copyright © 2020 Kassandra Capretta. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

//class RadiusLocations {
//    statis let locations = [
//}



//class PickerViewDataSource {
//static let religion = ["Atheist",
//  "Agnostic",
//  "Buddhist",
//  "Catholic",
//  "Christian",
//  "Hindu",
//  "Jewish",
//  "Muslim",
//  "Spiritual"]



//func setupData() {
//    // 1. check if system can monitor regions
//    if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
//
//        // 2. region data
//        let title = "Hill & West 5th Bar Hop"
//        let coordinate = CLLocationCoordinate2DMake(34.0487507009847, -118.25143799185756)
//        let regionRadius = 300.0
//
//        // 3. setup region
//        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
//            longitude: coordinate.longitude), radius: regionRadius, identifier: title)
//        locationManager.startMonitoring(for: region)
//
//        // 4. setup annotation
//        let restaurantAnnotation = MKPointAnnotation()
//        restaurantAnnotation.coordinate = coordinate;
//        restaurantAnnotation.title = "\(title)";
//        mapView.addAnnotation(restaurantAnnotation)
//
//        // 5. setup circle
//        let circle = MKCircle(center: coordinate, radius: regionRadius)
//        mapView.addOverlay(circle)
//    }
//    else {
//        print("System can't track regions")
//    }
//}
