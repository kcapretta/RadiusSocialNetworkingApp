//
//  EditProfileViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/14/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class EditProfileViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    
    @IBAction func backButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        var firstName = firstNameTextField.text
        var lastName = lastNameTextField.text
        var gender = genderTextField.text
        var height = heightTextField.text
        var ethnicity = ethnicityTextField.text
        var birthday = birthdayTextField.text
        var kids = kidsTextField.text
        var familyPlans = familyPlansTextField.text
        var religion = religionTextField.text
        var education = educationTextField.text
        var politics = politicalTextField.text
        var drinking = drinkingTextField.text
        

    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var ethnicityTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var kidsTextField: UITextField!
    
    @IBOutlet weak var familyPlansTextField: UITextField!
    
    @IBOutlet weak var hometownTextField: UITextField!
    
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    @IBOutlet weak var religionTextField: UITextField!
    
    @IBOutlet weak var educationTextField: UITextField!
    
    @IBOutlet weak var schoolTextField: UITextField!
    
    @IBOutlet weak var politicalTextField: UITextField!
    
    @IBOutlet weak var drinkingTextField: UITextField!
    
    // Pull data from Firebase
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?

    // Post as string
    var postData = [String]()
    
    // PICKER VIEW
    
    let gender = PickerViewDataSource.gender
    let kids = PickerViewDataSource.kids
    let height = PickerViewDataSource.heights
    let ethnicity = PickerViewDataSource.ethnicity
    //let birthday = DatePickerDataSource.birthday
    let familyPlans = PickerViewDataSource.familyPlans
    let religion = PickerViewDataSource.religion
    let education = PickerViewDataSource.education
    let politics = PickerViewDataSource.politics
    let drinking = PickerViewDataSource.drinking
    
    let genderPicker = UIPickerView()
    let kidsPicker = UIPickerView()
    let heightPicker = UIPickerView()
    let ethnicityPicker = UIPickerView()
    let birthdayPicker = UIDatePicker()
    let familyPlansPicker = UIPickerView()
    let religionPicker = UIPickerView()
    let educationPicker = UIPickerView()
    let politicsPicker = UIPickerView()
    let drinkingPicker = UIPickerView()
    
    var selectedGender: String?
    var selectedHeight: String?
    var selectedEthnicity: String?
    var selectedBirthday: String?
    var haveKids: Bool = false
    var selectedFamilyPlans: String?
    var selectedReligion: String?
    var selectedEducation: String?
    var selectedPolitics: String?
    var selectedDrinking: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIWithUserInfo()
        createPickers()
        createToolbar()
        
    }
    
    // Date Picker Date Changed
    @objc func dateChanged(datePicker: UIDatePicker) {
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MM/dd/yyyy"
           
           birthdayTextField.text = dateFormatter.string(from: datePicker.date)
           
           datePicker.backgroundColor = .white
           birthdayTextField.font = UIFont(name: "Avenir", size: 15.0)
       }
    
    func updateUIWithUserInfo() {
        // PULL DATA FROM FIREBASE
                
            // First Name
            firstNameTextField.text = newUser.firstName
            
            // Last Name
            lastNameTextField.text = newUser.lastName
        
            // Gender
            genderTextField.text = newUser.gender?.value.uiFriendlyDescription
            
            // Height
            heightTextField.text = newUser.height?.value
            
            // Ethnicity
            ethnicityTextField.text = newUser.ethnicity?.value.uiFriendlyDescription
            
            // Birthday
            birthdayTextField.text = newUser.birthday?.value
            
            // Kids
            kidsTextField.text = (newUser.kids?.value ?? false) ? "Have Kids" : "No Kids"
            
            // Family Plans
            familyPlansTextField.text = newUser.familyPlans?.value.uiFriendlyDescription
            
            // Hometown
            hometownTextField.text = newUser.homeTown?.value
            
            // Job Title
            jobTitleTextField.text = newUser.jobTitle?.value
            
            // Religion
            religionTextField.text = newUser.religiousBeliefs?.value.uiFriendlyDescription
            
            // Education
            educationTextField.text = newUser.educationLevel?.value.uiFriendlyDescription
            
            // School
            schoolTextField.text = newUser.school?.value
            
            // Politics
            politicalTextField.text = newUser.politics?.value.uiFriendlyDescription
            
            // Drinking
            drinkingTextField.text = newUser.drink?.value.uiFriendlyDescription
    }
    
      func createPickers() {
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
        genderPicker.backgroundColor = .white
        
        kidsPicker.delegate = self
        kidsTextField.inputView = kidsPicker
        kidsPicker.backgroundColor = .white
        
        heightPicker.delegate = self
        heightTextField.inputView = heightPicker
        heightPicker.backgroundColor = .white
        
        ethnicityPicker.delegate = self
        ethnicityTextField.inputView = ethnicityPicker
        ethnicityPicker.backgroundColor = .white
        
        //birthdayPicker.delegate = self
        birthdayTextField.inputView = birthdayPicker
        birthdayPicker.backgroundColor = .white
        
        // Date picker code
        // datePicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        birthdayPicker.addTarget(self, action: #selector(informationViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        birthdayPicker.backgroundColor = .white
        // Birthday maximum
        birthdayPicker.maximumDate = Calendar.current.date(byAdding: .year, value: -21, to: Date())
        
        familyPlansPicker.delegate = self
        familyPlansTextField.inputView = familyPlansPicker
        familyPlansPicker.backgroundColor = .white
    
        religionPicker.delegate = self
        religionTextField.inputView = religionPicker
        religionPicker.backgroundColor = .white
        
        educationPicker.delegate = self
        educationTextField.inputView = educationPicker
        educationPicker.backgroundColor = .white
        
        politicsPicker.delegate = self
        politicalTextField.inputView = politicsPicker
        politicsPicker.backgroundColor = .white
        
        drinkingPicker.delegate = self
        drinkingTextField.inputView = drinkingPicker
        drinkingPicker.backgroundColor = .white
        
    }
    
    // Toolbar for "Done" on Picker View
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(informationViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        // Make Toolbar work 
        genderTextField.inputAccessoryView = toolBar
        heightTextField.inputAccessoryView = toolBar
        ethnicityTextField.inputAccessoryView = toolBar
        birthdayTextField.inputAccessoryView = toolBar
        kidsTextField.inputAccessoryView = toolBar
        familyPlansTextField.inputAccessoryView = toolBar
        religionTextField.inputAccessoryView = toolBar
        educationTextField.inputAccessoryView = toolBar
        politicalTextField.inputAccessoryView = toolBar
        drinkingTextField.inputAccessoryView = toolBar
        firstNameTextField.inputAccessoryView = toolBar
        lastNameTextField.inputAccessoryView = toolBar
        hometownTextField.inputAccessoryView = toolBar
        jobTitleTextField.inputAccessoryView = toolBar
        schoolTextField.inputAccessoryView = toolBar
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
    view.endEditing(true)
    }

}

// Extension on PICKER VIEW
extension EditProfileViewController: UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch pickerView {
            case genderPicker: return gender.count
            case heightPicker: return height.count
            case ethnicityPicker: return ethnicity.count
            //case birthdayPicker: return birthday.count
            case kidsPicker: return kids.count
            case familyPlansPicker: return familyPlans.count
            case religionPicker: return religion.count
            case educationPicker: return education.count
            case politicsPicker: return politics.count
            case drinkingPicker: return drinking.count
            default: return 0
        }
    }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView {
            case genderPicker:
                selectedGender = gender[row]
                genderTextField.text = selectedGender
                return gender[row]
            case heightPicker:
                selectedHeight = height[row]
                heightTextField.text = selectedHeight
                return height[row]
            case ethnicityPicker:
                selectedEthnicity = ethnicity[row]
                ethnicityTextField.text = selectedEthnicity
                return ethnicity[row]
//            case birthdayPicker:
//                selectedBirthday = birthday[row]
//                birthdayTextField.text = selectedBirthday
//                return birthday[row]
            case kidsPicker:
                haveKids = kids[row] == "Have Kids"
                kidsTextField.text = kids[row]
                return kids[row]
            case familyPlansPicker:
                selectedFamilyPlans = familyPlans[row]
                familyPlansTextField.text = selectedFamilyPlans
                return familyPlans[row]
            case religionPicker:
                selectedReligion = religion[row]
                religionTextField.text = selectedReligion
                return religion[row]
            case educationPicker:
                selectedEducation = education[row]
                educationTextField.text = selectedEducation
                return education[row]
            case politicsPicker:
                selectedPolitics = politics[row]
                politicalTextField.text = selectedPolitics
                return politics[row]
            case drinkingPicker:
                selectedDrinking = drinking[row]
                drinkingTextField.text = selectedDrinking
                return drinking[row]
            default: return ""
            }
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch pickerView {
            case genderPicker:
                selectedGender = gender[row]
                genderTextField.text = selectedGender
            case heightPicker:
                selectedHeight = height[row]
                heightTextField.text = selectedHeight
            case ethnicityPicker:
                selectedEthnicity = ethnicity[row]
                ethnicityTextField.text = selectedEthnicity
            case birthdayPicker:
                selectedBirthday = birthdayPicker.date.description
                birthdayTextField.text = selectedBirthday
            case kidsPicker:
                haveKids = kids[row] == "Have Kids"
                kidsTextField.text = kids[row]
            case familyPlansPicker:
                selectedFamilyPlans = familyPlans[row]
                familyPlansTextField.text = selectedFamilyPlans
            case religionPicker:
                selectedReligion = religion[row]
                religionTextField.text = selectedReligion
            case educationPicker:
                selectedEducation = education[row]
                educationTextField.text = selectedEducation
            case politicsPicker:
                selectedPolitics = politics[row]
                politicalTextField.text = selectedPolitics
            case drinkingPicker:
                selectedDrinking = drinking[row]
                drinkingTextField.text = selectedDrinking
            default: print("Nothing")
            }
        }
    
}
