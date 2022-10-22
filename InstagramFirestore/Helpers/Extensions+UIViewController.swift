//
//  Extensions+UIViewController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/18/22.
//

import UIKit

extension UIViewController {
    
    func setGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [ UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

}
