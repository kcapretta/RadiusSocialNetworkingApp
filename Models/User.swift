//
//  User.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/23/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation

var newUser = LocalUser(firstName: "", lastName: "", email: "")

// SLICESIX

// Custom String

protocol UIFriendlyDescription {
    var uiFriendlyDescription: String { get }
}

struct UserInfo<T: CustomStringConvertible> {
    var type: String
    var value: T
    var visible: Bool

    func dictionaryFor() -> [String: Any] {
        if let object = value as? [CustomStringConvertible] {
            let result = object.map({ (item) -> CustomStringConvertible in
                return item.description
            })
            return [
                "value": result,
                "visible": visible
            ]
        } else {
            return  [
                "value": value.description,
                "visible": visible
            ]
        }
        
    }
}

// Politics

enum Politics: CustomStringConvertible, UIFriendlyDescription {
    case liberal
    case moderate
    case democrat
    case libertarian
    case conservative
    
    static func valueFor(choice: String) -> Politics {
        switch choice {
        case "liberal": return .liberal
        case "moderate": return .moderate
        case "democrat": return .democrat
        case "libertarian": return .libertarian
        case "conservative": return .conservative
        default: return .liberal
        }
    }
    
    var description: String {
        switch self {
        case .liberal: return "liberal"
        case .moderate: return "moderate"
        case .democrat: return "democrat"
        case .libertarian: return "libertarian"
        case .conservative: return "conservative"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .liberal: return "Liberal"
        case .moderate: return "Moderate"
        case .democrat: return "Democrat"
        case .libertarian: return "Libertarian"
        case .conservative: return "Conservative"
        }
    }
}

// Looking For

enum LookingFor: CustomStringConvertible {
    case men
    case women
    case both
    
    static func valueFor(choice: String) -> LookingFor {
        switch choice {
        case "men": return .men
        case "women": return .women
        default: return .women
        }
    }
    
    var description: String {
        switch self {
        case .men: return "men"
        case .women: return "women"
        case .both: return "both"
        }
    }
}
// Religion

enum Religion: CustomStringConvertible, UIFriendlyDescription {
    case atheist
    case agnostic
    case buddhist
    case catholic
    case christian
    case hindu
    case jewish
    case muslim
    case spiritual
    
    static func valueFor(choice: String) -> Religion {
        switch choice {
        case "atheist": return .atheist
        case "agnostic": return .agnostic
        case "buddhist": return .buddhist
        case "catholic": return .catholic
        case "christian": return .christian
        case "hindu": return .hindu
        case "jewish": return .jewish
        case "muslim": return .muslim
        case "spiritual": return .spiritual
        default: return .atheist
        }
    }
    
    var description: String {
        switch self {
        case .atheist: return "atheist"
        case .agnostic: return "agnostic"
        case .buddhist: return "buddhist"
        case .catholic: return "catholic"
        case .christian: return "christian"
        case .hindu: return "hindu"
        case .jewish: return "jewish"
        case .muslim: return "muslim"
        case .spiritual: return "spiritual"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .atheist: return "Atheist"
        case .agnostic: return "Agnostic"
        case .buddhist: return "Buddhist"
        case .catholic: return "Catholic"
        case .christian: return "Christian"
        case .hindu: return "Hindu"
        case .jewish: return "Jewish"
        case .muslim: return "Muslim"
        case .spiritual: return "Spiritual"
        }
    }
}

// Gender

enum Gender: CustomStringConvertible, UIFriendlyDescription {
    case woman
    case man
    case agender
    case androgyne
    case androgynous
    case bigender
    case demiman
    case demiwoman
    case genderfluid
    case genderneutral
    case gendernonconforming
    case genderquestioning
    case gendervariant
    case genderqueer
    case intersex
    case intersexman
    case intersexwoman
    case nonbinary
    case nongendered
    case pangender
    case polygender
    case thirdgender
    case transgender
    case transgenderman
    case transgenderwoman
    case transitioning
    case transsexual
    case twospirit
    
    static func valueFor(choice: String) -> Gender {
        switch choice {
        case "woman": return .woman
        case "man": return .man
        case "agender": return .agender
        case "androgyne": return .androgyne
        case "androgynous": return .androgynous
        case "bigender": return .bigender
        case "demiman": return .demiman
        case "demiwoman": return .demiwoman
        case "genderfluid": return .genderfluid
        case "genderneutral": return .genderneutral
        case "gendernonconforming": return .gendernonconforming
        case "genderquestioning": return .genderquestioning
        case "gendervariant": return .gendervariant
        case "genderqueer": return .genderqueer
        case "intersex": return .intersex
        case "intersexman": return .intersexman
        case "intersexwoman": return .intersexwoman
        case "nonbinary": return .nonbinary
        case "nongendered": return .nongendered
        case "pangender": return .pangender
        case "polygender": return .polygender
        case "thirdgender": return .thirdgender
        case "transgender": return .transgender
        case "transgenderman": return .transgenderman
        case "transgenderwoman": return .transgenderwoman
        case "transitioning": return .transitioning
        case "transsexual": return .transsexual
        case "twospirit": return .twospirit
        default: return .woman
        }
    }
    
    var uiFriendlyDescription: String {
        switch self {
        case .woman: return "Woman"
        case .man: return "Man"
        case .agender: return "Agender"
        case .androgyne: return "Androgyne"
        case .androgynous: return "Androgynous"
        case .bigender: return "Bigender"
        case .demiman: return "Demiman"
        case .demiwoman: return "Demiwoman"
        case .genderfluid: return "Gender Fluid"
        case .genderneutral: return "Gender Neutral"
        case .gendernonconforming: return "Gender Non-comforning"
        case .genderquestioning: return "Gender Questioning"
        case .gendervariant: return "gender Variant"
        case .genderqueer: return "Gender Queer"
        case .intersex: return "Intersex"
        case .intersexman: return "Intersexman"
        case .intersexwoman: return "Intersexwoman"
        case .nonbinary: return "Nonbinary"
        case .nongendered: return "Nongendered"
        case .pangender: return "Pangender"
        case .polygender: return "Polygender"
        case .thirdgender: return "Thirdgender"
        case .transgender: return "Transgender"
        case .transgenderman: return "Transgenderman"
        case .transgenderwoman: return "Transgenderwoman"
        case .transitioning: return "Transitioning"
        case .transsexual: return "Transsexual"
        case .twospirit: return "Two Spirit"
        }
    }
    
    var description: String {
        switch self {
        case .woman: return "woman"
        case .man: return "man"
        case .agender: return "agender"
        case .androgyne: return "androgyne"
        case .androgynous: return "androgynous"
        case .bigender: return "bigender"
        case .demiman: return "demiman"
        case .demiwoman: return "demiwoman"
        case .genderfluid: return "genderfluid"
        case .genderneutral: return "genderneutral"
        case .gendernonconforming: return "gendernonconforming"
        case .genderquestioning: return "genderquestioning"
        case .gendervariant: return "gendervariant"
        case .genderqueer: return "genderqueer"
        case .intersex: return "intersex"
        case .intersexman: return "intersexman"
        case .intersexwoman: return "intersexwoman"
        case .nonbinary: return "nonbinary"
        case .nongendered: return "nongendered"
        case .pangender: return "pangender"
        case .polygender: return "polygender"
        case .thirdgender: return "thirdgender"
        case .transgender: return "transgender"
        case .transgenderman: return "transgenderman"
        case .transgenderwoman: return "transgenderwoman"
        case .transitioning: return "transitioning"
        case .transsexual: return "transsexual"
        case .twospirit: return "twospirit"
        }
    }
}

// Ethnicity

enum Ethnicity: CustomStringConvertible, UIFriendlyDescription {

    case eastAsian
    case southAsian
    case middleEastern
    case americanIndian
    case africanDescent
    case hispanic
    case pacificIslander
    case caucasian
    
    static func valueFor(choice: String) -> Ethnicity {
        switch choice {
        case  "eastAsian": return .eastAsian
        case "southAsian": return .southAsian
        case "middleEastern": return .middleEastern
        case "americanIndian": return .americanIndian
        case "africanDescent": return .africanDescent
        case "hispanic": return .hispanic
        case "pacificIslander": return .pacificIslander
        case "caucasian": return .caucasian
        default: return .eastAsian
        }
    }
    
    var description: String {
        switch self {
        case .eastAsian: return "eastAsian"
        case .southAsian: return "southAsian"
        case .middleEastern: return "middleEastern"
        case .americanIndian: return "americanIndian"
        case .africanDescent: return "africanDescent"
        case .hispanic: return "hispanic"
        case .pacificIslander: return "pacificIslander"
        case .caucasian: return "caucasian"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .eastAsian: return "East Asian"
        case .southAsian: return "South Asian"
        case .middleEastern: return "Middle Eastern"
        case .americanIndian: return "American Indian"
        case .africanDescent: return "African Descent"
        case .hispanic: return "Hispanic"
        case .pacificIslander: return "Pacific Islander"
        case .caucasian: return "Caucasian"
        }
    }
    
}

// Family Plans

enum FamilyPlans: CustomStringConvertible, UIFriendlyDescription {
    case wantsKids
    case noKids
    case openToKids
    
    
    static func valueFor(choice: String) -> FamilyPlans{
        switch choice {
        case "wantsKids": return .wantsKids
        case "noKids": return .noKids
        case "openToKids": return .openToKids
        default: return .openToKids
        }
    }
    
    var description: String {
        switch self {
        case .wantsKids: return "wantsKids"
        case .noKids: return "noKids"
        case .openToKids: return "openToKids"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .wantsKids: return "Want Kids"
        case .noKids: return "Don't Want Kids"
        case .openToKids: return "Open To Kids"
        }
    }
}

// Education Level

enum EducationLevel: CustomStringConvertible, UIFriendlyDescription {
    case bootcamp
    case someCollege
    case selfTaught
    case undergrad
    case postgrad
    
    static func valueFor(choice: String) -> EducationLevel {
        switch choice {
        case "bootcamp": return .bootcamp
        case "someCollege": return .someCollege
        case "selfTaught": return .selfTaught
        case "undergrad": return .undergrad
        case "postgrad": return .postgrad
        default: return .bootcamp
        }
    }
    
    var description: String {
        switch self {
        case .bootcamp: return "bootcamp"
        case .someCollege: return "someCollege"
        case .selfTaught: return "selfTaught"
        case .undergrad: return "undergrad"
        case .postgrad: return "postgrad"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .bootcamp: return "Bootcamp"
        case .someCollege: return "Some College"
        case .selfTaught: return "Self Taught"
        case .undergrad: return "Undergrad"
        case .postgrad: return "Postgrad"
        }
    }
}

// Drink

enum Drink: CustomStringConvertible, UIFriendlyDescription {
    case yes
    case no
    case sometimes
    
    static func valueFor(choice: String) -> Drink {
        switch choice {
        case "yes": return .yes
        case "no": return .no
        case "sometimes": return .sometimes
        default: return .sometimes
        }
    }
    
    var description: String {
        switch self {
        case .yes: return "yes"
        case .no: return "no"
        case .sometimes: return "sometimes"
        }
    }
    
    var uiFriendlyDescription: String {
    switch self {
        case .yes: return "Yes"
        case .no: return "No"
        case .sometimes: return "Sometimes"
        }
    }
}

// Interested In

enum InterestedIn: CustomStringConvertible {
    case dating
    case networking
    case friendship
    
    static func valueFor(choice: [String]) -> [InterestedIn] {
        var result = [InterestedIn]()
        for item in choice {
            switch item {
            case "dating": result.append(.dating)
            case "networking": result.append(.networking)
            case "friendship": result.append(.friendship)
            default: result.append(contentsOf: [])
            }
        }
        return result
    }
    
    var description: String {
        switch self {
        case .dating: return "dating"
        case .networking: return "networking"
        case .friendship: return "friendship"
        }
    }
}


//SLICESEVEN
// Structure

struct LocalUser {
    var firstName: String
    var lastName: String
    var email:  String
    var gender: UserInfo<Gender>? = nil
    var profilePicture: UserInfo<String>? = nil
    var birthday: UserInfo<String>? = nil
    var jobTitle: UserInfo<String>? = nil
    var school: UserInfo<String>? = nil
    var educationLevel: UserInfo<EducationLevel>? = nil
    var religiousBeliefs: UserInfo<Religion>? = nil
    var homeTown: UserInfo<String>? = nil
    var politics: UserInfo<Politics>? = nil
    var height: UserInfo<String>? = nil
    var ethnicity: UserInfo<Ethnicity>? = nil
    var kids: UserInfo<Bool>? = nil
    var familyPlans: UserInfo<FamilyPlans>? = nil
    var drink: UserInfo<Drink>? = nil
    var lookingFor: UserInfo<LookingFor>? = nil
    var lifeGoal: UserInfo<String>? = nil
    var teachMe: UserInfo<String>? = nil
    var changeMind: UserInfo<String>? = nil
    var takePride: UserInfo<String>? = nil
    var imLookingFor: UserInfo<String>? = nil
    var toKnow: UserInfo<String>? = nil
    var interestedIn: UserInfo<[InterestedIn]>? = nil
    var accountPicture1: UserInfo<String>? = nil
    var accountPicture2: UserInfo<String>? = nil
    var accountPicture3: UserInfo<String>? = nil
    var accountPicture4: UserInfo<String>? = nil
    var accountPicture5: UserInfo<String>? = nil
    var accountPicture6: UserInfo<String>? = nil
    var userId: String? = nil
    var blocked: [String : Bool]? = [:]
    var report: [String: Bool]? = [:]
    
    
    //SLICEEIGHT
    func makeDictionary() -> [String: Any] {
        print("imlooking...", imLookingFor, changeMind)
        return [
            "firstName": firstName,
            "lastName": lastName,
            "gender": gender?.dictionaryFor() ?? [:],
            "email": email,
            "profilPicture": profilePicture?.dictionaryFor() ?? [:],
            "jobTitle": jobTitle?.dictionaryFor() ?? [:],
            "school": school?.dictionaryFor() ?? [:],
            "educationLevel": educationLevel?.dictionaryFor() ?? [:],
            "religiousBeliefs": religiousBeliefs?.dictionaryFor() ?? [:],
            "birthday": birthday?.dictionaryFor() ?? [:],
            "lookingFor": lookingFor?.dictionaryFor() ?? [:],
            "lifeGoal": lifeGoal?.dictionaryFor() ?? [:],
            "teachMe": teachMe?.dictionaryFor() ?? [:],
            "changeMind": changeMind?.dictionaryFor() ?? [:],
            "takePride": takePride?.dictionaryFor() ?? [:],
            "looking": imLookingFor?.dictionaryFor() ?? [:],
            "aboutYou": toKnow?.dictionaryFor() ?? [:],
            "interestedIn": interestedIn?.dictionaryFor() ?? [:],
            "politics": politics?.dictionaryFor() ?? [:],
            "drink": drink?.dictionaryFor() ?? [:],
            "familyPlans": familyPlans?.dictionaryFor() ?? [:],
            "kids": kids?.dictionaryFor() ?? [:],
            "ethnicity": ethnicity?.dictionaryFor() ?? [:],
            "homeTown": homeTown?.dictionaryFor() ?? [:],
            "height": height?.dictionaryFor() ?? [:],
            "accountPicture1": accountPicture1?.dictionaryFor() ?? [:],
            "accountPicture2": accountPicture2?.dictionaryFor() ?? [:],
            "accountPicture3": accountPicture3?.dictionaryFor() ?? [:],
            "accountPicture4": accountPicture4?.dictionaryFor() ?? [:],
            "accountPicture5": accountPicture5?.dictionaryFor() ?? [:],
            "accountPicture6": accountPicture6?.dictionaryFor() ?? [:],
            "blocked": blocked ?? [:],
            "report": report ?? [:]
        ]
    }
    
    //SLICENINE
    static func makeObjectFrom(_ dictionary: [String: Any]) -> LocalUser {
        let firstName = dictionary["firstName"] as? String ?? ""
        let lastName = dictionary["lastName"]  as? String ?? ""
        let email = dictionary["email"]  as? String ?? ""
        let gender = dictionary["gender"] as? [String: Any]
        let profilePicture = dictionary["profilePicture"] as? [String: Any]
        let jobTitle = dictionary["jobTitle"] as? [String: Any]
        let school = dictionary["school"] as? [String: Any]
        let educationLevel = dictionary["educationLevel"] as? [String: Any]
        let religiousBeliefs = dictionary["religiousBeliefs"] as? [String: Any]
        let birthday = dictionary["birthday"] as? [String: Any]
        let politics = dictionary["politics"] as? [String: Any]
        let ethnicity = dictionary["ethnicity"] as? [String: Any]
        let kids = dictionary["kids"] as? [String: Any]
        let drink = dictionary["drink"] as? [String: Any]
        let lookingFor = dictionary["lookingFor"] as? [String: Any]
        let homeTown = dictionary["homeTown"] as? [String: Any]
        let interestedIn = dictionary["interestedIn"] as? [String: Any]
        let familyPlans = dictionary["familyPlans"] as? [String: Any]
        let height = dictionary["height"] as? [String: Any]
        let lifeGoal = dictionary["lifeGoal"] as? [String :Any]
        let changeMind = dictionary["changeMind"] as? [String :Any]
        let takePride = dictionary["takePride"] as? [String :Any]
        let imLookingFor = dictionary["imLookingFor"] as? [String :Any]
        let teachMe = dictionary["teachMe"] as? [String :Any]
        let toKnow = dictionary["theKnow"] as? [String :Any]
        let accountPicture1 = dictionary["accountPicture1"] as? [String: Any]
        let accountPicture2 = dictionary["accountPicture2"] as? [String: Any]
        let accountPicture3 = dictionary["accountPicture3"] as? [String: Any]
        let accountPicture4 = dictionary["accountPicture4"] as? [String: Any]
        let accountPicture5 = dictionary["accountPicture5"] as? [String: Any]
        let accountPicture6 = dictionary["accountPicture6"] as? [String: Any]
        let blocked = dictionary["blocked"] as? [String:Bool] ?? [:]
        let report = dictionary["report"] as?
            [String:Bool] ?? [:]
        
        // SLICETEN
        //Set Values
        
        // Main Profile Picture
        let profilePict: UserInfo<String> = UserInfo(type: "profilePicture",
                                                     value: profilePicture?["value"] as? String ?? "",
                                                     visible: profilePicture?["visible"] as? Bool ?? false)
        
        // Account Pictures
        let accountPict1: UserInfo<String> = UserInfo(type: "accountPicture1",
        value: accountPicture1?["value"] as? String ?? "",
        visible: accountPicture1?["visible"] as? Bool ?? false)
        
        let accountPict2: UserInfo<String> = UserInfo(type: "accountPicture2",
        value: accountPicture2?["value"] as? String ?? "",
        visible: accountPicture2?["visible"] as? Bool ?? false)
        
        let accountPict3: UserInfo<String> = UserInfo(type: "accountPicture3",
        value: accountPicture3?["value"] as? String ?? "",
        visible: accountPicture3?["visible"] as? Bool ?? false)
        
        let accountPict4: UserInfo<String> = UserInfo(type: "accountPicture4",
        value: accountPicture4?["value"] as? String ?? "",
        visible: accountPicture4?["visible"] as? Bool ?? false)
        
        let accountPict5: UserInfo<String> = UserInfo(type: "accountPicture5",
        value: accountPicture5?["value"] as? String ?? "",
        visible: accountPicture5?["visible"] as? Bool ?? false)
        
        let accountPict6: UserInfo<String> = UserInfo(type: "accountPicture6",
        value: accountPicture6?["value"] as? String ?? "",
        visible: accountPicture6?["visible"] as? Bool ?? false)
        
        // Gender Value
        let genderValue: UserInfo<Gender> = UserInfo(type: "gender",
                                                     value: Gender.valueFor(choice: gender?["value"] as? String ?? ""),
                                                visible: gender?["visible"] as? Bool ?? false)
        
        // Job Title Value
        let jobTitleValue: UserInfo<String> = UserInfo(type: "jobTitle",
        value: jobTitle?["value"] as? String ?? "",
        visible: jobTitle?["visible"] as? Bool ?? false)
        
        // School Value
        let schoolValue: UserInfo<String> = UserInfo(type: "school",
        value: school?["value"] as? String ?? "",
        visible: school?["visible"] as? Bool ?? false)
        
        // HomeTown Value
        let homeTownValue: UserInfo<String> = UserInfo(type: "homeTown",
        value: homeTown?["value"] as? String ?? "",
        visible: homeTown?["visible"] as? Bool ?? false)
        
        // Religious Beliefs Value
        let religiousBeliefValue: UserInfo<Religion> = UserInfo(type: "religiousBeliefs",
                                                                value: Religion.valueFor(choice: religiousBeliefs?["value"] as? String ?? ""),
                                                                visible: religiousBeliefs?["visible"] as? Bool ?? false)
        
        // Education Level Value
        let educationLevelValue: UserInfo<EducationLevel> = UserInfo(type: "educationLevel",
                                                                value: EducationLevel.valueFor(choice: educationLevel?["value"] as? String ?? ""),
                                                                visible: educationLevel?["visible"] as? Bool ?? false)
        
        // Politics Value
        let politicsValue: UserInfo<Politics> = UserInfo(type: "politics",
                                                                value: Politics.valueFor(choice: politics?["value"] as? String ?? ""),
                                                                visible: politics?["visible"] as? Bool ?? false)
        
        // Ethnicity Value
        let ethnicityValue: UserInfo<Ethnicity> = UserInfo(type: "ethnicity",
                                                                value: Ethnicity.valueFor(choice: ethnicity?["value"] as? String ?? ""),
                                                                visible: ethnicity?["visible"] as? Bool ?? false)
        
        // Family Plans Value
        let familyPlansValue: UserInfo<FamilyPlans> = UserInfo(type: "familyPlans",
                                                                value: FamilyPlans.valueFor(choice: familyPlans?["value"] as? String ?? ""),
                                                                visible: kids?["visible"] as? Bool ?? false)
        
        // Drink Value
        let drinkValue: UserInfo<Drink> = UserInfo(type: "drink",
                                                                value: Drink.valueFor(choice: drink?["value"] as? String ?? ""),
                                                                visible: drink?["visible"] as? Bool ?? false)
    
        
        
        // Looking For Value ( men / women / both )
        let lookingForValue: UserInfo<LookingFor> = UserInfo(type: "lookingForValue",
                                                                value: LookingFor.valueFor(choice: lookingFor?["value"] as? String ?? ""),
                                                                visible: lookingFor?["visible"] as? Bool ?? false)
        
        // Interested In ( dating / networking / friendship )
               let interestedInValue: UserInfo<[InterestedIn]> = UserInfo(type: "interestedInValue",
                                                                       value: InterestedIn.valueFor(choice: interestedIn?["value"] as? [String] ?? []),
                                                                       visible: interestedIn?["visible"] as? Bool ?? false)
        
        // DATE PICKER
        // Birthday
        let birthdayValue: UserInfo<String> = UserInfo(type: "birthdayValue",
                                                                value: birthday?["value"] as? String ?? "",
                                                                visible: birthday?["visible"] as? Bool ?? false)
        
        
        
        // Height
        let heightValue: UserInfo<String> = UserInfo(type: "heightValue",
                                                                value: height?["value"] as? String ?? "",
                                                                visible: height?["visible"] as? Bool ?? false)
        
        // Life Goal
        let lifeGoalValue: UserInfo<String> = UserInfo(type: "lifeGoalValue",
                                                       value: lifeGoal?["value"] as? String ?? "",
                                                       visible: homeTown?["visible"] as? Bool ?? false)
        
        // Teach Me
        let teachMeValue: UserInfo<String> = UserInfo(type: "teachMeValue",
                                                       value: teachMe?["value"] as? String ?? "",
                                                       visible: teachMe?["visible"] as? Bool ?? false)
        
        // Change Mind
        let changeMindValue: UserInfo<String> = UserInfo(type: "changeMindValue",
                                                       value: changeMind?["value"] as? String ?? "",
                                                       visible: changeMind?["visible"] as? Bool ?? false)
        
//        // Take Pride
//        let takePrideValue: UserInfo<String> = UserInfo(type: "takePrideValue",
//                                                       value: takePride?["value"] as? String ?? "",
//                                                       visible: takePride?["visible"] as? Bool ?? false)
        
//        // I'm Looking For
//        let imLookingForValue: UserInfo<String> = UserInfo(type: "imLookingForValue",
//                                                       value: imLookingFor?["value"] as? String ?? "",
//                                                       visible: imLookingFor?["visible"] as? Bool ?? false)
        
//        // To Know
//        let toKnowValue: UserInfo<String> = UserInfo(type: "toKnowValue",
//                                                       value: toKnow?["value"] as? String ?? "",
//                                                       visible: toKnow?["visible"] as? Bool ?? false)
        
        
        
        // BOOLEAN VALUE
        // Kids
//        let kidsValue: UserInfo<Kids> = UserInfo(type: "kidsValue",
//                                                                value: Kids.valueFor(choice: kids?["value"] as? String ?? ""),
//                                                                visible: kids?["visible"] as? Bool ?? false)
        
        // Kids
         let kidsValue: UserInfo<Bool> = UserInfo(type: "kids",
                                                                value: kids?["value"] as? Bool ?? false,
                                                                visible: kids?["visible"] as? Bool ?? false)
        
        
        
        
        // SLICEELEVEN
        // Create localUser
        let localUser = LocalUser(firstName: firstName, lastName: lastName, email: email, gender: genderValue, profilePicture: profilePict, birthday: birthdayValue, jobTitle: jobTitleValue, school: schoolValue, educationLevel: educationLevelValue, religiousBeliefs: religiousBeliefValue, homeTown: homeTownValue, politics: politicsValue, height: heightValue, ethnicity: ethnicityValue, kids: kidsValue, familyPlans: familyPlansValue, drink: drinkValue, lookingFor: lookingForValue, lifeGoal: lifeGoalValue, teachMe: teachMeValue, changeMind: changeMindValue, interestedIn: interestedInValue, accountPicture1: accountPict1, accountPicture2: accountPict2, accountPicture3: accountPict3, accountPicture4: accountPict4, accountPicture5: accountPict5, accountPicture6: accountPict6, blocked: blocked, report: report)

        // takePride: takePrideValue, imLookingFor: imLookingForValue, toKnow: toKnowValue,
        
        return localUser
        
        
    }
}

