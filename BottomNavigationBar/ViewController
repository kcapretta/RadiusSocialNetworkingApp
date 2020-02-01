//
//  ViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 10/29/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Koloda
import MaterialComponents.MaterialBottomNavigation
import Firebase
import FirebaseAuth
import FirebaseStorage

class ViewController: UIViewController {
    
    @IBOutlet weak var mapOutlet: UIButton!
    
    @IBOutlet weak var interestedInCollectionView: UICollectionView!
    
    @IBOutlet weak var infoCollectionView: UICollectionView!
    
    @IBOutlet weak var viewOnData: UIView!
    
    // pan down for more info on person
    // @IBOutlet var panDown: UIPanGestureRecognizer!
    
    @IBOutlet weak var cardView: KolodaView!
    
    // Labels to Pull Data
    @IBOutlet weak var nameLbl : UILabel!
    
    let images = ["download1","download2","download3"]
    let townImage = "Town"
    let bottomNavBar = MDCBottomNavigationBar()
    let firebaseServer = FirebaseFunctions.shared
    
    // Block Button
    var currentUserId = Auth.auth().currentUser?.uid
    var otherUsersId = ""
    var isCurrentUserBlocked = false
    var isOtherUserBlocked = false
    
    // Report Button
    var isCurrentUserReported = false
    var isOtherUserReported = false
    
    var currentlyViewedUserId: String?
    
    
    var usersDict: [String: LocalUser] = [:]
    var users: [LocalUser] = []
    
    var userDetails: [[UserDetail: String]] = []
    var interestedInfo: [[InterestedInInfo: String]] = []
    
    // Post
    var postData = [UISwitch]()
    

    // FILTER BLOCKED USERS
    
    func filterBlockedUsers(from users: [LocalUser]) {
        var notBlockedUsers = users
        var notBlockedUsersDict = self.usersDict
        var blockedUsers = newUser.blocked ?? [:]
        if let currentUserId = Auth.auth().currentUser?.uid {
            blockedUsers[currentUserId] = true
        }
        
        for (userId, blocked) in blockedUsers ?? [:] {
            print("UserId...", userId)
            print("UserHere...", usersDict[userId])
            if let user = usersDict[userId] {
                notBlockedUsersDict.removeValue(forKey: userId)
                /*if let blockedUserIndex = notBlockedUsers.firstIndex(where: { $0.userId! == userId }) {
                    notBlockedUsers.remove(at: blockedUserIndex)
                }*/
            }
        }
        let notBlocked = Array(notBlockedUsersDict.values)
        self.users = notBlocked
    }
    
    // FILTER REPORTED USERS
    
    func filterReportUsers(from users: [LocalUser]) {
        var notReportUsers = users
        var notReportUsersDict = self.usersDict
        var reportUsers = newUser.report ?? [:]
        if let currentUserId = Auth.auth().currentUser?.uid {
            reportUsers[currentUserId] = true
        }
        
        for (userId, report) in reportUsers ?? [:] {
            print("UserId...", userId)
            print("UserHere...", usersDict[userId])
            if let user = usersDict[userId] {
                notReportUsersDict.removeValue(forKey: userId)
            }
        }
        let notReport = Array(notReportUsersDict.values)
        self.users = notReport
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(mapOutlet)
        
        infoCollectionView.flashScrollIndicators()
        interestedInCollectionView.flashScrollIndicators()
        
        infoCollectionView.dataSource = self
        infoCollectionView.delegate = self
        cardView.delegate = self
        cardView.dataSource = self
        
        interestedInCollectionView.dataSource = self
        interestedInCollectionView.delegate = self
        
        firebaseServer.fetchUsers {[weak self] (usersDict) in
            self?.usersDict = usersDict
            let fetchedUsers = Array(usersDict.values)
            self?.filterBlockedUsers(from: fetchedUsers)
            self?.filterReportUsers(from: fetchedUsers)
            self?.loadFirstUser()
            self?.cardView.reloadData()
        }
        
        
        // Shadow on View
        self.viewOnData.layer.shadowColor = UIColor.gray.cgColor
        self.viewOnData.layer.shadowOpacity = 0.5
        self.viewOnData.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.viewOnData.layer.shadowRadius = 7
        self.viewOnData.layer.masksToBounds = false

        
        self.navigationController?.navigationBar.backgroundColor = .white

        
        // Swipe gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
    }


    
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
            nameLbl.text = users[0].firstName
            setupDetailsFor(user: users[0])
            infoCollectionView.reloadData()
            interestedInCollectionView.reloadData()
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
    
    @IBAction func radiusNextVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let radiusVC = storyboard.instantiateViewController(identifier: "GeotificationsViewController")
                self.navigationController?.pushViewController(radiusVC, animated: true)
           

        let vc = CustomTabBarViewController()
                self.navigationController?.pushViewController(vc, animated: true)
        
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
    
    
    @objc
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {


            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                    print("Let's meet")
            case UISwipeGestureRecognizer.Direction.down:
                    print("My radius")
            case UISwipeGestureRecognizer.Direction.left:
                    print("No")
                default:
                    break
            }
        }
    }
    
    @IBAction func flagButton(_ sender: Any) {
        if let userIdToReport = currentlyViewedUserId {
            firebaseServer.reportSomeone(with: userIdToReport) {[weak self] (error) in
                if error == nil {
                    newUser.report?[userIdToReport] = true
                    self?.cardView.swipe(.left)
                }
                self?.showAlert(withTitle: "User Flagged", message: "Thank you for reporting!")
            }
        }
    }
}

extension ViewController : KolodaViewDelegate, KolodaViewDataSource {
    
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        let currentUser = users[index]
        currentlyViewedUserId = currentUser.userId
        print("Index of current card ", index)
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        let user = users[index]
        let storage = Storage.storage()
        let storageRef = storage.reference(withPath: "\(user.userId!)/photos/\(0)")
        PhotoUploader.downloadImageUrl(from: storageRef) { (url) in
            guard let url = url else { return }
            imageView.downloaded(from: url, contentMode: .scaleAspectFill)
        }
        
        return imageView
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return users.count
    }
    
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .left: print("No")
        case .right: print("YES")
        default: print("Ignore")
        }
        
        // Pull Data From Firebase For New User
        let user = users[index]
        setupDetailsFor(user: user)
        infoCollectionView.reloadData()
        interestedInCollectionView.reloadData()
        
        
        nameLbl.text = user.firstName
        }
    }


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userDetails.count
        return interestedInInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infoCell = infoCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! UserInfoCollectionViewCell
        var (userDetail, title) = userDetails[indexPath.item].first!
        if userDetail == .birthday {
            title = "\(calcAge(birthday: title))"
        }
        
        infoCell.setupCell(with: userDetail, title: title)
        return infoCell
        
    }
    
    func interestedInCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let interestedInCell = interestedInCollectionView.dequeueReusableCell(withReuseIdentifier: "infoCellId", for: indexPath) as! UserInfoCollectionViewCell
        var (interestedInInfo, title) = interestedInfo[indexPath.item].first!
    }
    
    interestedInCell.setupCell(with: InterestedInInfo, title: title)
    return interestedInCell

    
}



extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

      let padding: CGFloat = 8
      let collectionCellSize = collectionView.frame.size.width - padding

    return CGSize(width: collectionCellSize/1, height:22)

     }

     // Block User Button
     @IBAction func blockTapped(_ sender: UIButton) {
        if let userIdToBlock = currentlyViewedUserId {
            firebaseServer.blockSomeone(with: userIdToBlock) {[weak self] (error) in
                if error == nil {
                    newUser.blocked?[userIdToBlock] = true
                    self?.cardView.swipe(.left)
                }
                self?.showAlert(withTitle: "User Blocked", message: "You won't see this user again.")
            }
        }
     }
    
}



