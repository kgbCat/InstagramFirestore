//
//  ViewColors.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/17/22.
//

import UIKit

enum ViewColor {
    case buttonEnabled
    case buttonDisabled

    var associatedColor: UIColor {
        switch self {
        case .buttonEnabled: return UIColor(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
        case .buttonDisabled: return UIColor(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5))

        }
    }
}
