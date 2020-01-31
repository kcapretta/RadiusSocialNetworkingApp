//
//  RadiusMapLocationViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 1/25/20.
//  Copyright © 2020 Kassandra Capretta. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class RadiusMapLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
  let coordinate = CLLocationCoordinate2DMake(34.04892487945148, -118.2589748944156)

  var locationManager : CLLocationManager = CLLocationManager()

  // Authorize use of location
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    mapView.showsUserLocation = (status == .authorizedAlways)
  }

  // Entering region
  func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
           showAlert(withTitle: "You've entered \(region.identifier)", message: "Happy hopping!")
  }

  // Exiting region
  func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
         showAlert(withTitle: "You've exited \(region.identifier)", message: "")
  }

  // Creating region and notifying when exit / enter
  func region(with geotification: Geotification) -> CLCircularRegion {
    let region = CLCircularRegion(center: geotification.coordinate,
      radius: geotification.radius,
      identifier: geotification.identifier)
    region.notifyOnEntry = (geotification.eventType == .onEntry)
    region.notifyOnExit = !region.notifyOnEntry
    return region
  }

  // Monitoring region, if not "error"
     func startMonitoring(geotification: Geotification) {
       if !CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
         showAlert(withTitle:"Error", message: "Geofencing is not supported on this device!")
         return
       }
  }

     func stopMonitoring(geotification: Geotification) {
       for region in locationManager.monitoredRegions {
         guard let circularRegion = region as? CLCircularRegion,
           circularRegion.identifier == geotification.identifier else { continue }
         locationManager.stopMonitoring(for: circularRegion)
       }
     }
    
    func showCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance, mapView: MKMapView) {
        let circle = MKCircle(center: coordinate, radius: radius)
        mapView.addOverlay(circle)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let circleRenderer = MKCircleRenderer(overlay: overlay)
    circleRenderer.strokeColor = UIColor.red
    circleRenderer.lineWidth = 2.0
    return circleRenderer
    }

  override func viewDidLoad() {
      super.viewDidLoad()
      mapView.delegate = self
      mapView.userTrackingMode = .follow
      mapView.showsUserLocation = true
    
    let FigWest = CityLocation(title: "Figueroa & West 5th Bar Hop", coordinate: CLLocationCoordinate2D(latitude: 34.051786237359, longitude:-118.25721978675575))
    let OliveWest = CityLocation(title: "Olive & West 8th Bar Hop", coordinate: CLLocationCoordinate2D(latitude: 34.04532581294495, longitude: -118.25693614315244))
    let SpringWest = CityLocation(title: "South Spring & West 8th Bar Hop", coordinate: CLLocationCoordinate2D(latitude: 34.04281142133837, longitude: -118.2535363174975))
    let EastCentral = CityLocation(title: "East 1st & North Central Bar Hop", coordinate: CLLocationCoordinate2D(latitude: 34.049629090178904, longitude: -118.23952361941338))
    let HewittEast = CityLocation(title: "South Hewitt & East 4th Bar Hop", coordinate: CLLocationCoordinate2D(latitude: 34.04544848249697, longitude:-118.23643350508064))

      // Region of coordinate
      mapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)

     // mapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)

      let title = "West 7th & South Flower Bar Hop"
      let restaurantAnnotation = MKPointAnnotation()
      restaurantAnnotation.coordinate = coordinate
      restaurantAnnotation.title = title
      mapView.addAnnotation(restaurantAnnotation)
    mapView.addAnnotation(FigWest)
    mapView.addAnnotation(OliveWest)
    mapView.addAnnotation(SpringWest)
    mapView.addAnnotation(EastCentral)
    mapView.addAnnotation(HewittEast)

      let regionRadius = 100.0
      let circle = MKCircle(center: coordinate, radius: regionRadius)
      mapView.addOverlay(circle)

      self.locationManager.requestAlwaysAuthorization()
      self.locationManager.delegate = self as? CLLocationManagerDelegate

      //Zoom to user location
      if let userLocation = locationManager.location?.coordinate {
          let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
          mapView.setRegion(viewRegion, animated: false)
        }
    }

  }
