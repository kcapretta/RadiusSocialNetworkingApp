//
//  profilePageViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/8/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class profilePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var firstNameText: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let firebaseServer = FirebaseFunctions.shared
    
    // Post as string
    var postData = [String]()
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        // Cancels
        self.dismiss(animated: true, completion: nil)
        //Goes back
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let backCancel = storyboard.instantiateViewController(identifier: "SettingsViewController")
        self.navigationController?.pushViewController(backCancel, animated: true)
    }
    
    //Containing Views
    @IBOutlet weak var profilePicView1: UIView!
    @IBOutlet weak var profilePicView2: UIView!
    @IBOutlet weak var profilePicView3: UIView!
//    @IBOutlet weak var profilePicView4: UIView!
//    @IBOutlet weak var profilePicView5: UIView!
//    @IBOutlet weak var profilePicView6: UIView!
    
    
    // Profile picture ImageViews
    @IBOutlet weak var profilePhotoImageView1: UIImageView!
    @IBOutlet weak var profilePhotoImageView2: UIImageView!
    @IBOutlet weak var profilePhotoImageView3: UIImageView!
//    @IBOutlet weak var profilePhotoImageView4: UIImageView!
//    @IBOutlet weak var profilePhotoImageView5: UIImageView!
//    @IBOutlet weak var profilePhotoImageView6: UIImageView!
    
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    var currentlySettingImageViewTag: Int?
    var deleteSelectedPhoto: Int?
    
    // First Name Data
    var firstName: String =  ""
    
    // Photo delete buttons

    @IBOutlet weak var deletePhoto1: UIButton!
    @IBOutlet weak var deletePhoto2: UIButton!
    @IBOutlet weak var deletePhoto3: UIButton!
    @IBOutlet weak var deletePhoto4: UIButton!
    @IBOutlet weak var deletePhoto5: UIButton!
    @IBOutlet weak var deletePhoto6: UIButton!
    
    // Become invisible switch
   @IBAction func becomeInvisibleSwitch(_ sender: Any) {
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameText.text = newUser.firstName
        showProfilePicture()
        
        // updateUIWithUserInfo()
        
        // Photo Tapped Recognizer
        [profilePicView1, profilePicView2, profilePicView3].forEach {[weak self] (view) in
            guard let view = view else { return}
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageViewTapped))
            view.addGestureRecognizer(tapGesture)
        }
        pullUserImages()
    }
    
    func pullUserImages() {
        var index = 0
        let imageViews = [
        profilePhotoImageView1,
        profilePhotoImageView2,
        profilePhotoImageView3]
    
        
        if let uid = Auth.auth().currentUser?.uid {
            imageViews.forEach { (imageView) in
                if let imageView = imageView {
                    let storage = Storage.storage()
                    let storageRef = storage.reference(withPath: "\(uid)/photos/\(index)")
                    PhotoUploader.downloadImageUrl(from: storageRef) { (url) in
                        guard let url = url else { return }
                        imageView.downloaded(from: url, contentMode: .scaleAspectFill)
                    }
                }
                index = index + 1
            }
        } else {
            showAlert(withTitle: "Error", message: "Not signed in")
        }
    }
    
    // Main profile picture
    func showProfilePicture() {
        if let uid = Auth.auth().currentUser?.uid {
                    let storage = Storage.storage()
                    let storageRef = storage.reference(withPath: "\(uid)/photos/\(0)")
                    PhotoUploader.downloadImageUrl(from: storageRef) {[weak self] (url) in
                        guard let url = url else { return }
                        self?.profilePhotoImageView1.downloaded(from: url, contentMode: .scaleAspectFill)
                    }
        } else {
            showAlert(withTitle: "Error", message: "Not signed in")
        }
    }
    
    
    // Photo Tapped Recognizer Pt 2
    @objc func handleImageViewTapped(recognizer: UIGestureRecognizer) {
        currentlySettingImageViewTag = recognizer.view?.tag
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print("Image... ", image)
        
        guard let tag  = currentlySettingImageViewTag else { return }
        switch tag {
        case 0:
            profilePhotoImageView1.image = image
            case 1:
            profilePhotoImageView2.image = image
            case 2:
            profilePhotoImageView3.image = image
//            case 3:
//            profilePhotoImageView4.image = image
//            case 4:
//            profilePhotoImageView5.image = image
//            case 5:
//            profilePhotoImageView6.image = image
        default:
            profilePhotoImageView1.image = image
        }
        self.dismiss(animated: true, completion: nil)
        }
    
    // Save the data
    @IBAction func doneButtonTapped(_ sender: Any) {
        let images = [profilePhotoImageView1.image,
                      profilePhotoImageView2.image,
                      profilePhotoImageView3.image
        ]
        
        var filteredImages = images.filter { (image) -> Bool in
            return image != nil
        }
        
        var index = 0
        filteredImages.forEach { (image) in
            if let uid = Auth.auth().currentUser?.uid, let image = image {
                let storage = Storage.storage()
                let storageRef = storage.reference(withPath: "\(uid)/photos/\(index)")
                PhotoUploader.uploadImage(image, at: storageRef) {[weak self] (url) in
                    if url != nil {
                        print("url... ", url)
                       
                    } else {
                        self?.showAlert(withTitle: "Error", message: "Image Upload Failed")
                    }
                }
            } else {
                showAlert(withTitle: "Error", message: "No Image Selected")
            }
            
            index = index + 1
            
        }
        
    }
    
    @IBAction func editMyInformationTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editInfo = storyboard.instantiateViewController(identifier: "EditProfileViewController")
        self.navigationController?.pushViewController(editInfo, animated: true)}
    
    @IBAction func editMyQuestionsTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editQuestions = storyboard.instantiateViewController(identifier: "EditQuestionsViewController")
        self.navigationController?.pushViewController(editQuestions, animated: true)
    }
    
    // Create this after MVP
//    @IBAction func viewMyProfileTapped(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let editQuestions = storyboard.instantiateViewController(identifier: "ViewProfileViewController")
//        self.navigationController?.pushViewController(editQuestions, animated: true)
//
//    }
    
    @IBAction func connectionsTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let connections = storyboard.instantiateViewController(identifier: "ConnectionPreferencesViewController")
        self.navigationController?.pushViewController(connections, animated: true)
    }
}
