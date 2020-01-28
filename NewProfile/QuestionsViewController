//
//  QuestionsViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/10/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class QuestionsViewController: UIViewController {

    
    let firebaseServer = FirebaseFunctions.shared
    
    // Text Fields for Questions
    @IBOutlet weak var question1: UITextField!
    
    @IBOutlet weak var question2: UITextField!
    
    @IBOutlet weak var question3: UITextField!
    
   // @IBOutlet weak var question4: UITextField!
    
   // @IBOutlet weak var question5: UITextField!
    
   // @IBOutlet weak var question6: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Create "Done" button, save data and upload to Firebase
    @IBAction func questionsSaved(_ sender: Any) {
        
        guard var lifeGoal = question1.text,
            var teachMe = question2.text,
            var changeMind = question3.text
//            var takePride = question4.text,
//            var imLookingFor = question5.text,
//            var toKnow = question6.text
            else {
                print("Fill in all fields...")
                return }
        
        if question1.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              question2.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
              question3.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
//            question4.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//            question5.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//        question6.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
              
              showAlert(withTitle: "Error", message: "Please fill in all fields")
              return }
        
        //        let takePrideInfo = UserInfo(type: "takePride", value: takePride, visible: true)
        //        let imLookingForInfo = UserInfo(type: "imLookingFor", value: imLookingFor, visible: true)
        //        let toKnowInfo = UserInfo(type: "toKnow", value: toKnow, visible: true)
        let lifeGoalInfo = UserInfo(type: "lifeGoal", value: lifeGoal, visible: true)
        let teachMeInfo = UserInfo(type: "teachMe", value: teachMe, visible: true)
        let changeMindInfo = UserInfo(type: "changeMind", value: changeMind, visible: true)
        
        // takePrideInfo, imLookingForInfo, toKnowInfo
        firebaseServer.savePersonalDetailsQuestions(lifeGoalInfo, teachMeInfo, changeMindInfo) {[weak self] (error) in
        if error == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainPage = storyboard.instantiateViewController(identifier: "profilePageViewController")
            self?.navigationController?.present(mainPage, animated: true, completion: nil)
        }
        print("Error occurred", error)
            
        }
    
    }

    // Change look of Done Button
    @IBOutlet weak var doneButton1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createToolbar()
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        Utilities.styleFilledButton(doneButton1)
        
    }
    
    // Toolbar for "Done" on Picker View
        func createToolbar() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(QuestionsViewController.dismissKeyboard))
            
            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true

    // Make Toolbar work text fields
            question1.inputAccessoryView = toolBar
            question2.inputAccessoryView = toolBar
            question3.inputAccessoryView = toolBar
//            question4.inputAccessoryView = toolBar
//            question5.inputAccessoryView = toolBar
//            question6.inputAccessoryView = toolBar
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
        
        @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        }
  
}

extension UIView {

    func bindToKeyboard() {

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    @objc func keyboardWillChange(_ notification: NSNotification) {

        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let beginningFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var deltaY = endFrame.origin.y - beginningFrame.origin.y

        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIView.KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
    }
}
        
