//
//  AuthService.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/25/22.
//

import UIKit
import FirebaseAuth
import Firebase


struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let userName: String
    let photoUrl: String
}

struct AuthService {

    static func registerUser(withCredentials credentials: AuthCredentials,
                             completion: @escaping(Error?) -> Void) {
        // Create the user
        Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { authResult, error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            // get uid from the result
            guard let uid = authResult?.user.uid else { return }

            // create data to store in database
            let data: [String: Any] = ["email": credentials.email,
                                       "fullname": credentials.fullname,
                                       "profileImageUrl": credentials.photoUrl,
                                       "uid": uid,
                                       "username": credentials.userName]

            let dataBase = Firestore.firestore()
            dataBase.collection("users").addDocument(data: data) { error in
                if let error = error {
                    print("DEBUG: Failed to register user \(error.localizedDescription)")
                    return
                }
            }
        }
    }
}

