//
//  Exensions+UIButon.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/18/22.
//

import UIKit

extension UIButton {

    func setAttributedTitle(_ firstString: String, _ secondString: String) {

        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.8), .font: UIFont.systemFont(ofSize: 14)]

        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.8), .font: UIFont.boldSystemFont(ofSize: 16)]

        let attributedTitle = NSMutableAttributedString(string: "\(firstString)  ", attributes: atts)
        attributedTitle.append(NSAttributedString(string: secondString, attributes: boldAtts))
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
