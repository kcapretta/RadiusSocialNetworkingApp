//
//  signupViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/4/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class signupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    let firebaseServer = FirebaseFunctions.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signupButton)
    }
    
    // Check fields and validate
//    func validateFields() -> String? {
//
//        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
//        {
//
//            print("Fill in all fields")
//
//        }
//
//
//        // Check if the password is secure
//            let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//            if Utilities.isPasswordValid(cleanedPassword) == false {
//                // Password isn't secure enough
//                return "Please make sure your password is at least 8 characters, contains a special character and a number."
//            }
//
//            return nil }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        guard var firstName = firstNameTextField.text,
            var lastName = lastNameTextField.text,
            var email = emailTextField.text,
            var password = passwordTextField.text else {
                print("Fill in all fields")
                return
        }
            
        if firstName.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        
        lastName.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        
        email.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        
        password.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
            showAlert(withTitle: "Error", message: "Please fill in all fields")
        return }
        
        
        // Create the user, process data and go to next View Controller
        activityIndicator.startAnimating()
        firebaseServer.signUp(firstName: firstName, lastName: lastName, email: email, password: password) {[weak self] (user, error) in
            self?.activityIndicator.stopAnimating()
            if let user = user {
                newUser = user
            }
            
            
            
            if(error == nil) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let signupVC = storyboard.instantiateViewController(identifier: "introductionTextViewController")
                    self?.navigationController?.pushViewController(signupVC, animated: true)
                
            } else {
                print("An error occured")
            }
        }
        
    }
}
