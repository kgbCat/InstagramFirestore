//
//  LoginViewController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/15/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Instagram_logo_white")
        return iv
    }()

    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.textColor = .white
        tf.keyboardAppearance = .dark
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.setHeight(50)
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.8)])
        return tf
    }()

    private let loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Log In", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = ViewColor.loginButton.associatedColor
        bt.tintColor = .systemPurple
        bt.layer.cornerRadius = 5
        bt.setHeight(50)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        return bt
    }()



    private let signUpButton: UIButton = {
        let bt = UIButton()
        return bt
    }()




    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Helpers

    func configureUI() {

        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        setGradient()

        view.addSubview(iconImage)

        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        view.addSubview(stack)


        setConstraints(stack)



    }

    func setGradient(){
        let gradient = CAGradientLayer()
        gradient.colors = [ UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    func setConstraints(_ stack: UIStackView) {
        // image icon
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

        // stack view
        stack.axis = .vertical
        stack.spacing = 20
        stack.centerX(inView: view)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)

    }
    
}
