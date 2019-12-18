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

enum Politics: CustomStringConvertible {
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

enum Religion: CustomStringConvertible {
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
}

// Gender

enum Gender: CustomStringConvertible {
    case woman
    case man
    case other
    case agender
    case androgyne
    case androgynous
    case bigender
    case demiman
    case demiwoman
    // Two Word Items
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
        case "other": return .other
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
        case .other: return "other"
        case .twospirit: return "twospirit"
        }
    }
}

// Ethnicity

enum Ethnicity: CustomStringConvertible {

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
    
}

// Family Plans

enum FamilyPlans: CustomStringConvertible {
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
}

// Education Level

enum EducationLevel: CustomStringConvertible {
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
}

// Height

enum Height: CustomStringConvertible {
    case 122
    case 125
    case 128
    case 130
    case 133
    case 135
    case 138
    case 140
    case 143
    case 145
    case 148
    case 150
    case 153
    case 155
    case 158
    case 161
    case 163
    case 166
    case 168
    case 171
    case 173
    case 176
    case 178
    case 181
    case 183
    case 186
    case 189
    case 191
    case 194
    case 196
    case 199
    case 201
    case 204
    case 206
    case 209
    case 211
    case 214

    static func valueFor(choice: String) -> Height {
        switch choice {
        case "122": return .122
        case "125": return .125
        case "128": return .128
        case "130": return .130
        case "133": return .133
        case "135": return .135
        case "138": return .138
        case "140": return .140
        case "143": return .143
        case "145": return .145
        case "148": return .148
        case "150": return .150
        case "153": return .153
        case "155": return .155
        case "158": return .158
        case "161": return .161
        case "163": return .163
        case "166": return .166
        case "168": return .168
        case "171": return .171
        case "173": return .173
        case "176": return .176
        case "178": return .178
        case "181": return .181
        case "183": return .183
        case "189": return .189
        case "191": return .191
        case "194": return .194
        case "196": return .196
        case "199": return .199
        case "201": return .201
        case "204": return .204
        case "206": return .206
        case "209": return .209
        case "211": return .211
        case "214": return .214
        default: return .122
        }
    }
    var description: String {
        switch self {
        case .122: return "122"
        case .125: return "125"
        case .128: return "128"
        case .130: return "130"
        case .133: return "133"
        case .135: return "135"
        case .138: return "138"
        case .140: return "140"
        case .143: return "143"
        case .145: return "145"
        case .148: return "148"
        case .150: return "150"
        case .153: return "153"
        case .155: return "155"
        case .158: return "158"
        case .161: return "161"
        case .163: return "163"
        case .166: return "166"
        case .168: return "168"
        case .171: return "171"
        case .173: return "173"
        case .176: return "176"
        case .178: return "178"
        case .181: return "181"
        case .183: return "183"
        case .189: return "189"
        case .191: return "191"
        case .194: return "194"
        case .196: return "196"
        case .199: return "199"
        case .201: return "201"
        case .204: return "204"
        case .209: return "209"
        case .211: return "211"
        case .214: return "214"
        }
    }
}


// Drinking

enum Drinking: CustomStringConvertible {
    case yes
    case no
    case sometimes
    
    static func valueFor(choice: String) -> Drinking {
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
}

// Interested In

enum InterestedIn: CustomStringConvertible {
    case dating
    case networking
    case friendship
    
    static func valueFor(choice: String) -> InterestedIn {
        switch choice {
        case "dating": return .dating
        case "networking": return .networking
        case "friendship": return .friendship
        default: return .dating
        }
    }
    
    var description: String {
        switch self {
        case .dating: return "dating"
        case .networking: return "networking"
        case .friendship: return "friendship"
        }
    }
}

// Smoking

enum Smoking: CustomStringConvertible {
    case yes
    case no
    case sometimes
    
    static func valueFor(choice: String) -> Smoking{
        switch choice {
        case "yes": return .yes
        case "no": return .no
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
    //var height: UserInfo<String>? = nil
    var ethnicity: UserInfo<Ethnicity>? = nil
    var kids: UserInfo<Bool>? = nil
    var familyPlans: UserInfo<FamilyPlans>? = nil
    var drinking: UserInfo<Drinking>? = nil
    var smoking: UserInfo<Smoking>? = nil
    var lookingFor: UserInfo<LookingFor>? = nil
    var lifeGoals: UserInfo<String>? = nil
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
    
    //SLICEEIGHT
    func makeDictionary() -> [String: Any] {
        print("imlooking...", imLookingFor)
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
            "lifeGoal": lifeGoals?.dictionaryFor() ?? [:],
            "teachMe": teachMe?.dictionaryFor() ?? [:],
            "changeMind": changeMind?.dictionaryFor() ?? [:],
            "takePride": takePride?.dictionaryFor() ?? [:],
            "looking": imLookingFor?.dictionaryFor() ?? [:],
            "aboutYou": toKnow?.dictionaryFor() ?? [:],
            "interestedIn": interestedIn?.dictionaryFor() ?? [:],
            "politics": interestedIn?.dictionaryFor() ?? [:],
            "drinking": drinking?.dictionaryFor() ?? [:],
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
            "accountPicture6": accountPicture6?.dictionaryFor() ?? [:]
            
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
        let politics = dictionary["politics"] as? [String: Any]
        let ethnicity = dictionary["ethnicity"] as? [String: Any]
        let kids = dictionary["kids"] as? [String: Any]
        let drinking = dictionary["drinking"] as? [String: Any]
        let smoking = dictionary["smoking"] as? [String: Any]
        let lookingFor = dictionary["lookingFor"] as? [String: Any]
        let homeTown = dictionary["homeTown"] as? [String: Any]
        let interestedIn = dictionary["interestedIn"] as? [String: Any]
        let familyPlans = dictionary["familyPlans"] as? [String: Any]
        let height = dictionary["height"] as? [String: Any]
        let accountPicture1 = dictionary["accountPicture1"] as? [String: Any]
        let accountPicture2 = dictionary["accountPicture2"] as? [String: Any]
        let accountPicture3 = dictionary["accountPicture3"] as? [String: Any]
        let accountPicture4 = dictionary["accountPicture4"] as? [String: Any]
        let accountPicture5 = dictionary["accountPicture5"] as? [String: Any]
        let accountPicture6 = dictionary["accountPicture6"] as? [String: Any]
        
        
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
        let politicsValue: UserInfo<Politics> = UserInfo(type: "politicsValue",
                                                                value: Politics.valueFor(choice: politics?["value"] as? String ?? ""),
                                                                visible: politics?["visible"] as? Bool ?? false)
        
        // Ethnicity Value
        let ethnicityValue: UserInfo<Ethnicity> = UserInfo(type: "ethnicityValue",
                                                                value: Ethnicity.valueFor(choice: ethnicity?["value"] as? String ?? ""),
                                                                visible: ethnicity?["visible"] as? Bool ?? false)
        
        // Family Plans Value
        let familyPlansValue: UserInfo<FamilyPlans> = UserInfo(type: "familyPlansValue",
                                                                value: FamilyPlans.valueFor(choice: kids?["value"] as? String ?? ""),
                                                                visible: kids?["visible"] as? Bool ?? false)
        
        // Drinking Value
        let drinkingValue: UserInfo<Drinking> = UserInfo(type: "drinkingValue",
                                                                value: Drinking.valueFor(choice: drinking?["value"] as? String ?? ""),
                                                                visible: drinking?["visible"] as? Bool ?? false)
        
        // Smoking Value
        let smokingValue: UserInfo<Smoking> = UserInfo(type: "smokingValue",
                                                                value: Smoking.valueFor(choice: smoking?["value"] as? String ?? ""),
                                                                visible: smoking?["visible"] as? Bool ?? false)
        
        // Looking For Value ( men / women / both )
        let lookingForValue: UserInfo<LookingFor> = UserInfo(type: "lookingForValue",
                                                                value: LookingFor.valueFor(choice: lookingFor?["value"] as? String ?? ""),
                                                                visible: lookingFor?["visible"] as? Bool ?? false)
        
        // Interested In ( dating / networking / friendship )
               let interestedInValue: UserInfo<InterestedIn> = UserInfo(type: "interestedInValue",
                                                                       value: InterestedIn.valueFor(choice: interestedIn?["value"] as? String ?? ""),
                                                                       visible: interestedIn?["visible"] as? Bool ?? false)
        
        // DATE PICKER
        // Birthday
//        let birthdayValue: UserInfo<Birthday> = UserInfo(type: "birthdayValue",
//                                                                value: Birthday.valueFor(choice: birthday?["value"] as? String ?? ""),
//                                                                visible: birthday?["visible"] as? Bool ?? false)
        
        
        
        // CURRENTLY WORKING ON
        // Height
        let heightValue: UserInfo<Height> = UserInfo(type: "heightValue",
                                                                value: Height.valueFor(choice: height?["value"] as? String ?? ""),
                                                                visible: height?["visible"] as? Bool ?? false)
        
        
        
        // BOOLEAN VALUE
        // Kids
//        let kidsValue: UserInfo<Kids> = UserInfo(type: "kidsValue",
//                                                                value: Kids.valueFor(choice: kids?["value"] as? String ?? ""),
//                                                                visible: kids?["visible"] as? Bool ?? false)
        
        // Kids
        // let kidsValue: UserInfo<Kids> = UserInfo(type: "kidsValue",
//                                                                value: Kids.valueFor(choice: kids?["value"] as? String ?? ""),
//                                                                visible: kids?["visible"] as? Bool ?? false)
        
        
        
        // SLICEELEVEN
        // Create localUser
        let localUser = LocalUser(firstName: firstName, lastName: lastName, email: email, gender: genderValue, profilePicture: profilePict, birthday: nil, jobTitle: jobTitleValue, school: schoolValue, educationLevel: educationLevelValue, religiousBeliefs: religiousBeliefValue, homeTown: homeTownValue, politics: politicsValue, ethnicity: ethnicityValue, familyPlans: familyPlansValue, drinking: drinkingValue, smoking: smokingValue, lookingFor: lookingForValue, lifeGoals: nil, teachMe: nil, changeMind: nil, takePride: nil, height: heightValue, imLookingFor: nil, toKnow: nil, interestedIn: interestedInValue, accountPicture1: accountPict1, accountPicture2: accountPict2, accountPicture3: accountPict3, accountPicture4: accountPict4, accountPicture5: accountPict5, accountPicture6: accountPict6)
        // kids
        // birthday
        
        return localUser
        
        
    }
}
