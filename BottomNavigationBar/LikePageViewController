//
//  LikePageViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/26/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class LikePageViewController: UIViewController {
    
    @IBOutlet weak var infoIconImageView: UIImageView!
    
    @IBOutlet weak var infoCollectionView: UIView!
    
    @IBOutlet weak var viewOnData: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let firebaseServer = FirebaseFunctions.shared
    
    // "No" Button / Block Button
    var currentUserId = Auth.auth().currentUser?.uid
    var otherUsersId = ""
    var isCurrentUserBlocked = false
    var isOtherUserBlocked = false
    
    var currentlyViewedUserId: String?
    
    
    var usersDict: [String: LocalUser] = [:]
    var users: [LocalUser] = []
    
    var userDetails: [[UserDetail: String]] = []
    
    

    func filterBlockedUsers(from users: [LocalUser]) {
        var notBlockedUsers = users
        var blockedUsers = newUser.blocked ?? [:]
        if let currentUserId = Auth.auth().currentUser?.uid {
            blockedUsers[currentUserId] = true
            usersDict[currentUserId] = newUser
        }
        
        for (userId, blocked) in blockedUsers ?? [:] {
            if let user = usersDict[userId] {
                if let blockedUserIndex = notBlockedUsers.firstIndex(where: { $0.userId == userId }) {
                    notBlockedUsers.remove(at: blockedUserIndex)
                }
            }
        }
        // THINGS GO HERE
        self.users = notBlockedUsers
    }

   // var firstName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameLabel.text = user.firstName
//
//        infoCollectionView.dataSource = self
//        infoCollectionView.delegate = self
        
        firebaseServer.fetchUsers {[weak self] (usersDict) in
            let fetchedUsers = Array(usersDict.values)
            self?.filterBlockedUsers(from: fetchedUsers)
            self?.loadFirstUser()
        }
        
        // Shadow on View
        self.viewOnData.layer.shadowColor = UIColor.gray.cgColor
        self.viewOnData.layer.shadowOpacity = 0.5
        self.viewOnData.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.viewOnData.layer.shadowRadius = 7
        self.viewOnData.layer.masksToBounds = false

        
        self.navigationController?.navigationBar.backgroundColor = .white
    }
    
    // Use???
    func loadFirstUser() {
        if users.count > 0 {
            let imageView = UIImageView()
            let storage = Storage.storage()
            let storageRef = storage.reference(withPath: "\(users[0].userId!)/photos/\(0)")
            currentlyViewedUserId = users[0].userId
            PhotoUploader.downloadImageUrl(from: storageRef) { (url) in
                guard let url = url else { return }
                imageView.downloaded(from: url, contentMode: .scaleAspectFill)
            }
            nameLabel.text = users[0].firstName
            setupDetailsFor(user: users[0])
            //infoCollectionView.reloadData()
        }
    }
    
    func setupDetailsFor(user: LocalUser) {
        var userDetails: [[UserDetail: String]] = []
        let birthday = user.birthday
        let height = user.height
        let kids = user.kids
        let familyPlans = user.familyPlans
        let jobTitle = user.jobTitle
        let ethnicity = user.ethnicity
        let hometown = user.homeTown
        let drinking = user.drink
        let politics = user.politics
        let school = user.school
        let religion = user.religiousBeliefs
        let education = user.educationLevel
        
        if let visible = jobTitle?.visible, visible {
            userDetails.append([.jobTitle: jobTitle!.value.description])
        }
        
        if let visible = birthday?.visible, visible {
            userDetails.append([.birthday: birthday!.value.description])
        }
        
        if let visible = height?.visible, visible {
            userDetails.append([.height: height!.value.description])
        }
        
        if let visible = kids?.visible, visible {
            userDetails.append([.kids: (newUser.kids?.value ?? false) ? "Have Kids" : "No Kids"])
        }
        
        if let visible = familyPlans?.visible, visible {
            userDetails.append([.familyPlans: familyPlans!.value.description])
        }
        
        if let visible = ethnicity?.visible, visible {
            userDetails.append([.ethnicity: ethnicity!.value.uiFriendlyDescription])
        }
        
        if let visible = hometown?.visible, visible {
            userDetails.append([.hometown: hometown!.value.description])
        }
        
        if let visible = drinking?.visible, visible {
            userDetails.append([.drinking: drinking!.value.uiFriendlyDescription])
        }
        
        if let visible = politics?.visible, visible {
            userDetails.append([.politics: politics!.value.uiFriendlyDescription])
        }
        
        if let visible = school?.visible, visible {
                   userDetails.append([.school: school!.value.description])
               }
        
        if let visible = religion?.visible, visible {
                   userDetails.append([.religion: religion!.value.uiFriendlyDescription])
               }
        
        if let visible = education?.visible, visible {
            userDetails.append([.education: education!.value.uiFriendlyDescription])
        }
        
        self.userDetails = userDetails
    }
    
    // Change Birthdate to Age
    func calcAge(birthday: String) -> Int {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age!
    }
    
    @IBAction func noTapped(_ sender: UIButton) {
        if let userIdToBlock = currentlyViewedUserId {
        firebaseServer.blockSomeone(with: userIdToBlock) { (error) in
            if error == nil {
                newUser.blocked?[userIdToBlock] = true
                }
            }
        }

    }

}

extension ViewController {

//func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
//    let currentUser = users[index]
//    currentlyViewedUserId = currentUser.userId
//    print("Index of current card ", index)
//}
    
//func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//
//    let imageView = UIImageView()
//    let user = users[index]
//    let storage = Storage.storage()
//    let storageRef = storage.reference(withPath: "\(user.userId!)/photos/\(0)")
//    PhotoUploader.downloadImageUrl(from: storageRef) { (url) in
//        guard let url = url else { return }
//        imageView.downloaded(from: url, contentMode: .scaleAspectFill)
//    }
//
//    return imageView
//}

//func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
//    return users.count
//}


//func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
//    switch direction {
//    case .left: print("No")
//    case .right: print("YES")
//    default: print("Ignore")
//        }
//
//    }
    
    // Pull Data From Firebase For New User
//    let user = users[index]
//    setupDetailsFor(user: user)
//    infoCollectionView.reloadData()
//
//
//    extension ViewController: UICollectionViewDataSource {
//        func infoCollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return userDetails.count
//        }
        
        func infoCollectionView(_ infoCollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = infoCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! UserInfoCollectionViewCell
            var (userDetail, title) = userDetails[indexPath.item].first!
            if userDetail == .birthday {
                title = "\(calcAge(birthday: title))"
            }
            
            cell.setupCell(with: userDetail, title: title)
            return cell
        }
    }


    extension ViewController {
        
        func infoCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

          let padding: CGFloat = 30
          let collectionCellSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionCellSize/2, height:50)

         }

    }


