//
//  datingOptionViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/26/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit


class datingOptionViewController: BaseViewController, UIPickerViewDelegate {

    // Text Fields for Picker Views
    
    @IBOutlet weak var familyPlansText: UITextField!
    
    @IBOutlet weak var kidsOptionText: UITextField!
    
    @IBOutlet weak var ethnicityText: UITextField!
    
    @IBOutlet weak var menSelection: UIButton!
    
    @IBOutlet weak var womenSelection: UIButton!
    
    // Activity Indicator to process and save data
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var selectedGender:[Int] = []
    
    let familyPlansPicker = UIPickerView()
    let kidsPicker = UIPickerView()
    let ethnicityPicker = UIPickerView()
    
    let familyPlans = PickerViewDataSource.familyPlans
    let kids = PickerViewDataSource.kids
    let ethnicity = PickerViewDataSource.ethnicity
    
    let firebaseServer = FirebaseFunctions.shared
    
    let pickerView = UIPickerView()

    var selectedFamilyPlans: String?
    var selectedKids: String?
    var selectedEthnicity: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide "Back"
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        
       createFamilyPicker()
        createToolbar()
        
        Utilities.styleHollowButton(menSelection)
        Utilities.styleHollowButton(womenSelection)
        
    }
    
    // Buttons to select the gender you're interested in
    @IBAction func genderSelected(_ sender: UIButton) {
        if let index = selectedGender.firstIndex(of: sender.tag) {
            selectedGender.remove(at: index)
            Utilities.styleHollowButton(sender)
        } else {
            selectedGender.append(sender.tag)
            Utilities.styleFilledButton(sender)
        }
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        guard var family = familyPlansText.text,
            var kids = kidsOptionText.text,
            var ethnicity = ethnicityText.text,
            selectedGender.count != 0 else {
                showAlert(withTitle: "Error", message: "Please fill in all fields")
                return }
        
        // Removing unnecessary spaces and making lowercase
        family = family.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        kids = kids.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
        ethnicity = ethnicity.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "").lowercased()
            
        let familyInfo = UserInfo(type: "family", value: FamilyPlans.valueFor(choice: family), visible: true)
        let kidsInfo = UserInfo(type: "kids", value: kids == "havekids", visible: true)
        let ethnicityInfo = UserInfo(type: "ethnicity", value: Ethnicity.valueFor(choice: ethnicity), visible: true)
        
        var lookingFor = UserInfo(type: "lookingfor", value: LookingFor.both, visible: true)
        if selectedGender.count == 1 {
            lookingFor.value = selectedGender[0] == 0 ? .men : .women
        }
        
        // Save data to Firebase and move to next View Controller
        activityIndicator.startAnimating()
        
        firebaseServer.savePersonalDetailsThree(familyInfo, kidsInfo, ethnicityInfo, lookingFor) {[weak self] (error) in
            self?.activityIndicator.stopAnimating()
            if error == nil {
                self?.navigationController?.popViewController(animated: true)
            }
            print("Saved details three... ", error)
        }
    }


    func createFamilyPicker() {
        
        familyPlansPicker.delegate = self
        familyPlansText.inputView = familyPlansPicker
        familyPlansPicker.backgroundColor = .white
        
        kidsPicker.delegate = self
        kidsOptionText.inputView = kidsPicker
        kidsPicker.backgroundColor = .white
        
        ethnicityPicker.delegate = self
        ethnicityText.inputView = ethnicityPicker
        ethnicityPicker.backgroundColor = .white
    }
    
    // Toolbar for "Done"
        func createToolbar() {
            let toolBar = UIToolbar()
            toolBar.sizeToFit()

            // "Done" Button for Toolbar on Picker View
            let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(PageOneViewController.dismissKeyboard))

            toolBar.setItems([doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true

            // Makes Toolbar Work Properly
            familyPlansText.inputAccessoryView = toolBar
            kidsOptionText.inputAccessoryView = toolBar
            ethnicityText.inputAccessoryView = toolBar
            
    }


    @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    }

        // Extension on Dating Picker Views
       extension datingOptionViewController: UIPickerViewDataSource {
            func numberOfComponents(in pickerView: UIPickerView) -> Int {
                return 1
            }
            
            func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                switch pickerView {
                case familyPlansPicker: return familyPlans.count
                case kidsPicker: return kids.count
                case ethnicityPicker: return ethnicity.count
                default: return 0
                }
            }
            
            func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                
                switch pickerView{
                case familyPlansPicker: selectedFamilyPlans = familyPlans[row]
                familyPlansText.text = selectedFamilyPlans
                    return familyPlans[row]
                case kidsPicker:
                    selectedKids = kids[row]
                    kidsOptionText.text = selectedKids
                    return kids[row]
                case ethnicityPicker:
                    selectedEthnicity = ethnicity[row]
                    ethnicityText.text = selectedEthnicity
                    return ethnicity[row]
                default: return ""
                }
            }
            
            func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                switch pickerView {
                case familyPlansPicker:
                    selectedFamilyPlans = familyPlans[row]
                    familyPlansText.text = selectedFamilyPlans
                case kidsPicker:
                    selectedKids = kids[row]
                    kidsOptionText.text = selectedKids
                case ethnicityPicker:
                    selectedEthnicity = ethnicity[row]
                    ethnicityText.text = selectedEthnicity
                default: print("Nothing...")
                }
                if(pickerView == familyPlansPicker) {
                    selectedFamilyPlans = familyPlans[row]
                    familyPlansText.text = selectedFamilyPlans
                } else if (pickerView == familyPlansPicker) {
                }

            }
        }
            
