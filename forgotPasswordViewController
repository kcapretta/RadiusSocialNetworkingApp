//
//  forgotPasswordViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/23/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import ProgressHUD

class forgotPasswordViewController: UIViewController {

    @IBOutlet weak var resetPassword: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        Utilities.styleFilledButton(resetPassword)

        func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                callback?(error)
            }
        }
   }
    
    // Process "Forgot Password"
    @IBAction func resetPasswordButton(_ sender: Any) {
        guard let email = emailTextField.text, email != "" else {
            ProgressHUD.showError(ERROR_EMPTY_EMAIL_RESET)
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: "email@email") { error in //User.
            Radius.resetPassword(email: email, onSuccess: {
            self.view.endEditing(true)
            ProgressHUD.showSuccess(SUCCESS_EMAIL_RESET)
            self.navigationController?.popViewController(animated: true)
        }) { (errorMessage) in
            ProgressHUD.showError(errorMessage)
        }
    }

}
    
    @IBAction func sendForgotPW(_ sender: UIButton) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(identifier: "ViewController")
                self.navigationController?.pushViewController(loginVC, animated: true)
           

        let vc = ViewController()
                self.navigationController?.pushViewController(vc, animated: true)
        }
    
      // Process information, save and move to next View Controller
    @IBAction func forgotPasswordNext(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let backToLogin = storyboard.instantiateViewController(identifier: "loginViewController")
        self.navigationController?.pushViewController(backToLogin, animated: true)
    }
}

