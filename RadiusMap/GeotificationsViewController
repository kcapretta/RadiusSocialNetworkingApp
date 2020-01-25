//
//  GeotificationsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/9/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

struct PreferencesKeys {
  static let savedItems = "savedItems"
}

class GeotificationsViewController: UIViewController {
    
    let locationManager:CLLocationManager = CLLocationManager()
  
  @IBOutlet weak var mapView: MKMapView!
  
  var geotifications: [Geotification] = []
    
    let manager = CLLocationManager()
    
    let latitude: CLLocationDegrees = 37.2
    let longitude: CLLocationDegrees = 22.9
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    let homeLocation = CLLocation(latitude: 34.0522, longitude: -118.2437)
    let regionRadius: CLLocationDistance = 300
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        mapView.showsUserLocation = true
        centerMapOnLocation(location: homeLocation)
    
    locationManager.delegate = self
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
    locationManager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
    locationManager.distanceFilter = 100
    
    mapView.showsUserLocation = true
    
    loadAllGeotifications()
    
  }
    
  // MARK: Loading and saving functions
  func loadAllGeotifications() {
    geotifications.removeAll()
    let allGeotifications = Geotification.allGeotifications()
    //allGeotifications.forEach { add($0) }
  }
  
  func saveAllGeotifications() {
    let encoder = JSONEncoder()
    do {
      let data = try encoder.encode(geotifications)
      UserDefaults.standard.set(data, forKey: PreferencesKeys.savedItems)
    } catch {
      print("error encoding geotifications")
    }
  }
  
  func updateGeotificationsCount() {
    title = "Geotifications: \(geotifications.count)"
    navigationItem.rightBarButtonItem?.isEnabled = (geotifications.count < 20)
  }
  
  // MARK: Map overlay functions
  
  func removeRadiusOverlay(forGeotification geotification: Geotification) {
    // Find exactly one overlay which has the same coordinates & radius to remove
    guard let overlays = mapView?.overlays else { return }
    for overlay in overlays {
      guard let circleOverlay = overlay as? MKCircle else { continue }
      let coord = circleOverlay.coordinate
      if coord.latitude == geotification.coordinate.latitude && coord.longitude == geotification.coordinate.longitude && circleOverlay.radius == geotification.radius {
        mapView?.removeOverlay(circleOverlay)
        break
      }
    }
  }
  
  // MARK: Other mapview functions
    func zoomToCurrentLocation(sender: AnyObject) {
    mapView.zoomToUserLocation()
  }
  
  func region(with geotification: Geotification) -> CLCircularRegion {
    let region = CLCircularRegion(center: geotification.coordinate, radius: geotification.radius, identifier: geotification.identifier)
    region.notifyOnEntry = (geotification.eventType == .onEntry)
    region.notifyOnExit = !region.notifyOnEntry
    return region
  }
  
  func startMonitoring(geotification: Geotification) {
    if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
      showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
      return
    }
    
    let fenceRegion = region(with: geotification)
    locationManager.startMonitoring(for: fenceRegion)
  }

}


// MARK: AddGeotificationViewControllerDelegate
extension GeotificationsViewController: AddGeotificationsViewControllerDelegate {
  
  func addGeotificationViewController(_ controller: AddGeotificationViewController, didAddCoordinate coordinate: CLLocationCoordinate2D, radius: Double, identifier: String, note: String, eventType: Geotification.EventType) {
    controller.dismiss(animated: true, completion: nil)
    let clampedRadius = min(radius, locationManager.maximumRegionMonitoringDistance)
    let geotification = Geotification(coordinate: coordinate, radius: clampedRadius, identifier: identifier, note: note, eventType: eventType)
   // add(geotification)
    startMonitoring(geotification: geotification)
    saveAllGeotifications()
  }
  
}

// MARK: - Location Manager Delegate
extension GeotificationsViewController: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    }
  
  func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
    print("Monitoring failed for region with identifier: \(region!.identifier)")
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Location Manager failed with the following error: \(error)")
  }
  
}
