//
//  HiddenVisibleViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/30/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class HiddenVisibleViewController: UIViewController {

    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    var firebaseServer = FirebaseFunctions.shared

    
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var ethnicitySegmentControl: UISegmentedControl!
    
    @IBOutlet weak var kidsSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var familyPlansSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var hometownSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var jobTitleSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var religionSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var educationSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var schoolSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var politicsSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var drinkingSegmentControl: UISegmentedControl!
    
    let userInfo: [VisibleItem] = [.gender, .ethnicity, .kids, .familyPlans, .homeTown, .jobTitle, .religion, .educationLevel, .school, .politics, .drinking]
    
    @IBAction func toggleVisibility(_ sender: UISegmentedControl) {
        let visible = sender.selectedSegmentIndex == 0
        firebaseServer.setVisibility(visible: visible, item: userInfo[sender.tag]) { (error) in
            if error != nil {
                self.showAlert(withTitle: "Error", message: "Could not toggle visibility")
                sender.selectedSegmentIndex = visible ? 1 : 0
            }
        }
    }
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInfoVisibility()
    }
    
    func updateUserInfoVisibility() {
        let gender = newUser.gender
        let ethnicity = newUser.ethnicity
        let kids = newUser.kids
        let familyPlans = newUser.familyPlans
        let homeTown = newUser.homeTown
        let job = newUser.jobTitle
        let religion = newUser.religiousBeliefs
        let education = newUser.educationLevel
        let school = newUser.school
        let politics = newUser.politics
        let drinking = newUser.drink
        
        genderSegmentControl.selectedSegmentIndex = gender?.visible ?? false ? 0 : 1
        ethnicitySegmentControl.selectedSegmentIndex = ethnicity?.visible ?? false ? 0 : 1
        kidsSegmentControl.selectedSegmentIndex = kids?.visible ?? false ? 0 : 1
        familyPlansSegmentControl.selectedSegmentIndex = familyPlans?.visible ?? false ? 0 : 1
        hometownSegmentControl.selectedSegmentIndex = homeTown?.visible ?? false ? 0 : 1
        jobTitleSegmentControl.selectedSegmentIndex = job?.visible ?? false ? 0 : 1
        religionSegmentControl.selectedSegmentIndex = religion?.visible ?? false ? 0 : 1
        educationSegmentControl.selectedSegmentIndex = education?.visible ?? false ? 0 : 1
        schoolSegmentControl.selectedSegmentIndex = school?.visible ?? false ? 0 : 1
        politicsSegmentControl.selectedSegmentIndex = politics?.visible ?? false ? 0 : 1
        drinkingSegmentControl.selectedSegmentIndex = drinking?.visible ?? false ? 0 : 1
    }
}
