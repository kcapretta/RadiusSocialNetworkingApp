//
//  SettingsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/11/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SettingsViewController: UIViewController, UIImagePickerControllerDelegate {
    
    var databaseHandle:DatabaseHandle?
    var currentlySettingImageViewTag: Int?
    
    let firebaseServer = FirebaseFunctions.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showProfilePicture()
    }
    
    func showProfilePicture() {
        if let uid = Auth.auth().currentUser?.uid {
                    let storage = Storage.storage()
                    let storageRef = storage.reference(withPath: "\(uid)/photos/\(0)")
                    PhotoUploader.downloadImageUrl(from: storageRef) {[weak self] (url) in
                        guard let url = url else { return }
                        self?.displayProfileImage.downloaded(from: url, contentMode: .scaleAspectFill)
                    }
        } else {
            showAlert(withTitle: "Error", message: "Not signed in")
        }
    }
    
    @IBOutlet weak var displayProfileImage: UIImageView!
    
    @IBAction func nextPreferencesVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextPrefVC = storyboard.instantiateViewController(identifier: "preferencesViewController")
        self.navigationController?.pushViewController(nextPrefVC, animated: true)
    }
    
    @IBAction func nextAccountVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextAVC = storyboard.instantiateViewController(identifier: "AccountViewController")
        self.navigationController?.pushViewController(nextAVC, animated: true)
    }
    
    @IBAction func nextHelpVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextHVC = storyboard.instantiateViewController(identifier: "HelpCenterViewController")
        self.navigationController?.pushViewController(nextHVC, animated: true)
    }
    
    @IBAction func startEditProfile(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let backBVC13 = storyboard.instantiateViewController(identifier: "profilePageViewController")
            self.navigationController?.pushViewController(backBVC13, animated: true)
    }
}

