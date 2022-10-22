//
//  RegisterViewModel.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/22/22.
//

import UIKit

struct RegisterViewModel: AuthenticationViewModelProtocol {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?

    var isFormValid: Bool {
        return email?.isEmpty == false
            && password?.isEmpty == false
                && fullname?.isEmpty == false
                    && username?.isEmpty == false
    }

    var buttonBackgroundColor: UIColor {
        return isFormValid ? ViewColor.buttonEnabled.associatedColor : ViewColor.buttonDisabled.associatedColor
    }

    var buttonTitleColor: UIColor {
        return isFormValid ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
