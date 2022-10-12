//
//  Image.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/12/22.
//

import UIKit

enum Image {

    case feedSelected, feedUnselected
    case searchSelected, searchUnselected
    case plusSelected, plusUnselected
    case likeSelected, likeUnselected
    case profileSelected, profileUnselected


}

extension Image {

    var image: UIImage {
        switch self {
        case .feedSelected:
            return UIImage(named: "home_selected") ?? UIImage()
        case .feedUnselected:
            return UIImage(named: "home_unselected") ?? UIImage()
        case .searchSelected:
            return UIImage(named: "search_selected") ?? UIImage()
        case .searchUnselected:
            return UIImage(named: "search_unselected") ?? UIImage()
        case .plusSelected:
            return UIImage(named: "plus_unselected") ?? UIImage()
        case .plusUnselected:
            return UIImage(named: "plus_unselected") ?? UIImage()
        case .likeSelected:
            return UIImage(named: "like_selected") ?? UIImage()
        case .likeUnselected:
            return UIImage(named: "like_unselected") ?? UIImage()
        case .profileSelected:
            return UIImage(named: "profile_selected") ?? UIImage()
        case .profileUnselected:
            return UIImage(named: "profile_unselected") ?? UIImage()
        }
    }
}
