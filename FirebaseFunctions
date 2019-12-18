//
//  FirebaseFunctions.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/23/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation
import Firebase


// SLICEONE
protocol FirebaseFunctionsProtocol {
    
    // SIGN UP
    func signUp(firstName: String, lastName: String, email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void)
    
    // SIGN IN
    func signIn(email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void)

    func updateUserInfo(user: [String: Any])
    
    // PROFILE PICTURE
    func uploadProfilePicture(pictureUrl: String)
    
    // LIKE SOMEONE
    func likeSomeone(userId: String)
    
    // ACCEPT MATCH
    func acceptMatch(userId: String)
    
    // LISTED MATCHES
    func listMatches()
    
    // CURRENT LOCATION
    func updateLocation(long: Double, lat: Double)
    
    // PEOPLE NEAR
    func listNearbyPeople()
    
    // GENDER
    func setGender(gender: String, completion: @escaping (Error?) -> Void)
    
    // FAMILY PLANS
    func setFamilyPlans(familyPlans: String, completion: @escaping (Error?) -> Void)
   
    // KIDS
    func setKids(kids: String, completion: @escaping (Error?) -> Void)
    
    // ETHNICITY
    func setEthnicity(ethnicity: String, completion: @escaping (Error?) -> Void)
    
    // LOOKING FOR
    func setLookingFor(lookingFor: String, completion: @escaping (Error?) -> Void)
    
    // INTERESTED IN
    func setInterestedIn(interestedIn: String, completion: @escaping (Error?) -> Void)
    
    // RELIGION
    func setReligion(religion: String, completion: @escaping (Error?) -> Void)
    
    // EDUCATION LEVEL
    func setEducationLevel(educationLevel: String, completion: @escaping (Error?) -> Void)
    
    // POLITICS
    func setPolitics(politics: String, completion: @escaping (Error?) -> Void)
    
    // HEIGHT
       func setHeight(height: String, completion: @escaping (Error?) -> Void)
    
    // HOMETOWN
    func setHometown(homeTown: String, completion: @escaping (Error?) -> Void)
    
    // BIRTHDAY
    func setBirthday(birthday: String, completion: @escaping (Error?) -> Void)
    
    // JOB TITLE
    func setJobTitle(jobTitle: String, completion: @escaping (Error?) -> Void)
    
    // SCHOOL
    func setSchool(school: String, completion: @escaping (Error?) -> Void)
    

    // SLICETWO
    // FUNCTIONS to save data
    
    // HomeTown, Birthday, Gender, Job Title, Religion
    func savePersonalDetailsOne(_ hometown: UserInfo<String>, _ birthday: UserInfo<String>, _ gender: UserInfo<Gender>, _ jobtitle: UserInfo<String>, _ religion: UserInfo<Religion>, completion: @escaping (Error?) -> Void)
    
    // School, Education, Politics, Drinking, Height
    func savePersonalDetailsTwo(_ school: UserInfo<String>, _ education: UserInfo<EducationLevel>, _ politics: UserInfo<Politics>, _ drinking: UserInfo<Drinking>, _ height: UserInfo<String>, completion: @escaping (Error?) -> Void)
    
     // Questions Input
    func savePersonalDetailsQuestions(_ q1: UserInfo<String>, _ q2: UserInfo<String>, _ q3: UserInfo<String>, _ q4: UserInfo<String>, _ q5: UserInfo<String>, _ q6: UserInfo<String>, completion: @escaping (Error?) -> Void)

    // Family Plans, Kids, Ethnicity, Looking For
    func savePersonalDetailsThree(_ family: UserInfo<FamilyPlans>, _ kids: UserInfo<Bool>, _ ethnicity: UserInfo<Ethnicity>, _ lookingFor: UserInfo<LookingFor>, completion: @escaping (Error?) -> Void)
    
    // Interested In Dating / Networking / Friendship
    func saveInterestedIn(interestedIn: UserInfo<[InterestedIn]>,  completion: @escaping (Error?) -> Void)
    
    // Account Pictures Functions
    func saveAccountPictures(_ accountPicture1: UserInfo<String>, _ accountPicture2: UserInfo<String>, _ accountPicture3: UserInfo<String>, _ accountPicture4: UserInfo<String>, _ accountPicture5: UserInfo<String>, _ accountPicture6: UserInfo<String>, completion: @escaping (Error?) -> Void)
    
}

    // SLICETHREE
class FirebaseFunctions: FirebaseFunctionsProtocol {
    
    
    // Interested In Dating / Networking / Friendship
    func saveInterest(interestedIn: UserInfo<[InterestedIn]>,  completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.interestedIn = interestedIn
             usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                 print("Error ", error, ref)
                 completion(error)
            }
        }
    }

    // Account Pictures
    func saveAccountPictures(_ accountPicture1: UserInfo<String>, _ accountPicture2: UserInfo<String>, _ accountPicture3: UserInfo<String>, _ accountPicture4: UserInfo<String>, _ accountPicture5: UserInfo<String>, _ accountPicture6: UserInfo<String>, completion: @escaping (Error?) -> Void) {
           let usersRef = db.child("users")
           
           if let uid = Auth.auth().currentUser?.uid {
               newUser.accountPicture1 = accountPicture1
               newUser.accountPicture2 = accountPicture2
               newUser.accountPicture3 = accountPicture3
               newUser.accountPicture4 = accountPicture4
               newUser.accountPicture5 = accountPicture5
               newUser.accountPicture6 = accountPicture5

                usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                    print("Error ", error, ref)
                    completion(error)
               }
           }
       }
    
    // Life Goals, Teach Me, Change Mind, Take Pride, Looking, About You
    func savePersonalDetailsQuestions(_ lifeGoal: UserInfo<String>, _ teachMe: UserInfo<String>, _ changeMind: UserInfo<String>, _ takePride: UserInfo<String>, _ looking: UserInfo<String>, _ aboutYou: UserInfo<String>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.lifeGoals = lifeGoal
            newUser.teachMe = teachMe
            newUser.takePride = takePride
            newUser.imLookingFor = looking
            newUser.toKnow = aboutYou

             usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                 print("Error ", error, ref)
                 completion(error)
            }
        }
    }
    
    // Family Plans, Kids, Ethnicity, Looking For men / women / both
    func savePersonalDetailsThree(_ family: UserInfo<FamilyPlans>, _ kids: UserInfo<Bool>, _ ethnicity: UserInfo<Ethnicity>, _ lookingFor: UserInfo<LookingFor>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.familyPlans = family
            newUser.kids = kids
            newUser.lookingFor = lookingFor
            newUser.ethnicity = ethnicity
       
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // School, Education Level, Politics, Drinking, Height
    func savePersonalDetailsTwo(_ school: UserInfo<String>, _ education: UserInfo<EducationLevel>, _ politics: UserInfo<Politics>, _ drinking: UserInfo<Drinking>, _ height: UserInfo<String>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.school = school
            newUser.educationLevel = education
            newUser.politics = politics
            ////newUser.height = height
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
        }
    }
    
    // HomeTown, Birthday, Gender, Job Title
    func savePersonalDetailsOne(_ hometown: UserInfo<String>, _ birthday: UserInfo<String>, _ gender: UserInfo<Gender>, _ jobtitle: UserInfo<String>, _ religion: UserInfo<Religion>, completion: @escaping (Error?) -> Void) {
        let usersRef = db.child("users")
        // guard let key = usersRef.childByAutoId().key else { return }
        
        if let uid = Auth.auth().currentUser?.uid {
            newUser.homeTown = hometown
            newUser.birthday = birthday
            newUser.gender = gender
            newUser.jobTitle = jobtitle
            newUser.religiousBeliefs = religion
            
            usersRef.child("\(uid)").setValue(newUser.makeDictionary()){(error: Error?, ref: DatabaseReference) in
                print("Error ", error, ref)
                completion(error)
            }
            
        }
    }
    
    // SLICEFOUR
    // SIGN UP FUNCTION, first name, last name, email, password
    let db = Database.database().reference()
    func signUp(firstName: String, lastName: String, email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void) {
        let usersRef = db.child("users")
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            
            if let uid = result?.user.uid {
                let newUser: [String: String] = ["firstName": firstName, "lastName": lastName, "email": email]
                let newLocalUser = LocalUser(firstName: firstName, lastName: lastName, email: email)
                usersRef.child(uid).setValue(newUser){(error: Error?, ref: DatabaseReference) in
                    completion(newLocalUser, error)
                }
            } else {
                completion(nil, nil)
            }
        }
    }
    
    // SIGN IN FUNCTION, email, password
    func signIn(email: String, password: String, completion: @escaping (LocalUser?, Error?) -> Void) {
        let usersRef = db.child("users")
        Auth.auth().signIn(withEmail: email, password: password) { [weak self]
                (result, error) in
                guard let user = result?.user else {
                    completion(nil, error)
                    return
                }
                
                let uid = user.uid
                
                usersRef.child(uid).observeSingleEvent(of: .value) { (snapshot) in
                    let value = snapshot.value as? [String: Any]
                    if let user = value {
                        let userObject = LocalUser.makeObjectFrom(user)
                        print("New user ", userObject)
                        completion(userObject, nil)
                    } else {
                        completion(nil, error)
                    }
                }
        }
    }
    
    //SLICEFIVE
    func updateUserInfo(user: [String : Any]) {

    }
    
    func setGender(gender: String, completion: @escaping (Error?) -> Void){
        let usersRef = db.child("users")
        if let uid = Auth.auth().currentUser?.uid {
            usersRef.child("\(uid)/gender/value").setValue(gender) {(error: Error?, ref: DatabaseReference) in
                completion(error)
            }
        }
    }
    
    func uploadProfilePicture(pictureUrl: String) {

    }
    
    func uploadAccountPictures(pictureUrl: String) {
        
    }
    
    func likeSomeone(userId: String) {
        
    }
    
    func acceptMatch(userId: String) {
        
    }
    
    func listMatches() {
        
    }
    
    func updateLocation(long: Double, lat: Double) {
    
    }
    
    func listNearbyPeople() {
        
    }
    
    static let shared: FirebaseFunctions = FirebaseFunctions()

}
