//
//  Ref.swift
//  Radius
//
//  Created by Kassandra Capretta on 12/7/19.
//  Copyright © 2019 Kassandra Capretta. All rights reserved.
//

import Foundation
import Firebase

let ERROR_EMPTY_EMAIL_RESET = "Please enter your email address to reset your password"
let SUCCESS_EMAIL_RESET = "We have just sent you an email to reset your password. Please check your inbox."

func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
        if error == nil {
            onSuccess()
        } else {
            onError(error!.localizedDescription)
        }
    }
}
