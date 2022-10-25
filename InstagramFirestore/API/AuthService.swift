//
//  AuthService.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/25/22.
//

import UIKit

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let userName: String
    let photo: UIImage
}

struct AuthService {
    static func registerUser(withCredentials credentials: AuthCredentials) {
        print(credentials)
    }
}
