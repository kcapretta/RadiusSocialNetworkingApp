//
//  CustomTabBarViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/6/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit
import Firebase

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
            super.viewDidLoad()
            
            //setup our custom view controllers
            viewControllers = []
            let layout = UICollectionViewFlowLayout()
            let friendsController = FriendsController(collectionViewLayout: layout)
            let recentMessagesNavController = friendsController// UINavigationController(rootViewController: friendsController)
            recentMessagesNavController.tabBarItem.title = "Recent"
            recentMessagesNavController.tabBarItem.image = UIImage(named: "recent")
            
        viewControllers = [recentMessagesNavController, createDummyNavControllerWithTitle(title: "Calls", imageName: "calls"), createDummyNavControllerWithTitle(title: "Groups", imageName: "groups"), createDummyNavControllerWithTitle(title: "People", imageName: "people"), createDummyNavControllerWithTitle(title: "Settings", imageName: "settings")]
        }
        
        private func createDummyNavControllerWithTitle(title: String, imageName: String) -> UINavigationController {
            let viewController = UIViewController()
            let navController = UINavigationController(rootViewController: viewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = UIImage(named: imageName)
            return navController
        }
    }
