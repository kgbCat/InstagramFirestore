//
//  AuthenticationViewModelProtocol.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/22/22.
//

import UIKit

protocol AuthenticationViewModelProtocol {
    var isFormValid: Bool { get }

    var buttonBackgroundColor: UIColor { get }

    var buttonTitleColor: UIColor { get }
}
