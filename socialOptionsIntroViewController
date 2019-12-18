//
//  socialOptionsIntroViewController.swift
//  Radius
//
//  Created by Kassandra Capretta on 11/26/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import UIKit

class socialOptionsIntroViewController: UIViewController {

    @IBOutlet weak var soundsGood: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(soundsGood)
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    @IBAction func nextTextVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextSocialOptions = storyboard.instantiateViewController(identifier: "socialOptionsViewController")
        self.navigationController?.pushViewController(nextSocialOptions, animated: true)
    }
}
