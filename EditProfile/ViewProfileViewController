//
//  ViewProfileViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/15/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    let firebaseServer = FirebaseFunctions.shared
    
    @IBOutlet weak var displayProfilePicture: UIImageView!
    
    // Labels for Data
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var kidsLabel: UILabel!
    
    @IBOutlet weak var familyPlansLabel: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    
    @IBOutlet weak var ethnicityLabel: UILabel!
    
    @IBOutlet weak var hometownLabel: UILabel!
    
    @IBOutlet weak var drinkingLabel: UILabel!
    
    @IBOutlet weak var politicsLabel: UILabel!
    
    @IBOutlet weak var schoolLabel: UILabel!
    
    @IBOutlet weak var religionLabel: UILabel!
    
    @IBOutlet weak var educationLabel: UILabel!
    
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var currentlySettingImageViewTag: Int?

    // Post as string
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showProfilePicture()
        
        // Pull data from Firebase
        var ref:DatabaseReference?
        var databaseHandle:DatabaseHandle?

        // Post as string
        var postData = [String]()
        
        var school: String =  ""

        // Pull Data From newUser
        firstNameLabel.text = newUser.firstName
        
        ageLabel.text = newUser.birthday?.value
        heightLabel.text = newUser.height?.value
        kidsLabel.text = (newUser.kids?.value ?? false) ? "Have Kids" : "No Kids"
        familyPlansLabel.text = newUser.familyPlans?.value.uiFriendlyDescription
        occupationLabel.text = newUser.jobTitle?.value
        ethnicityLabel.text = newUser.ethnicity?.value.uiFriendlyDescription
        hometownLabel.text = newUser.homeTown?.value
        drinkingLabel.text = newUser.drink?.value.uiFriendlyDescription
        politicsLabel.text = newUser.politics?.value.uiFriendlyDescription
        schoolLabel.text = newUser.school?.value
        religionLabel.text = newUser.religiousBeliefs?.value.uiFriendlyDescription
        educationLabel.text = newUser.educationLevel?.value.uiFriendlyDescription
    }
    
    func showProfilePicture() {
        if let uid = Auth.auth().currentUser?.uid {
                    let storage = Storage.storage()
                    let storageRef = storage.reference(withPath: "\(uid)/photos/\(0)")
                    PhotoUploader.downloadImageUrl(from: storageRef) {[weak self] (url) in
                        guard let url = url else { return }
                        self?.displayProfilePicture.downloaded(from: url, contentMode: .scaleAspectFill)
                    }
        } else {
            showAlert(withTitle: "Error", message: "Not signed in")
        }
    }

    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
        }
    
    }


