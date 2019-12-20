//
//  Utilities.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/5/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation
import UIKit
import MapKit

struct Colors {
    static let radiusGreen = UIColor(red: 116/255, green: 203/255, blue: 128/255, alpha: 1)
    static let whiteBackground = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
}

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 116/255, green: 203/255, blue: 128/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 116/255, green: 203/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func disableButton(_ button:UIButton) {
        button.isEnabled = false
        button.alpha = 0.6
    }
    
    static func enableButton(_ button:UIButton) {
        button.isEnabled = true
        button.alpha = 1
    }
    
    static func smallButton(_ button:UIButton) {
        
        button.backgroundColor = UIColor.init(red: 116/255, green: 203/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
}

// MAP Radius Addition

// MARK: Helper Extensions
extension UIViewController {
  func showAlert(withTitle title: String?, message: String?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}

extension MKMapView {
  func zoomToUserLocation() {
    guard let coordinate = userLocation.location?.coordinate else { return }
    let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
    setRegion(region, animated: true)
  }
}


