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
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()

    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
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

    private let helpWithSignInButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setAttributedTitle("Forgot your password?", "Get help signing in.")
        return bt
    }()

    private let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setAttributedTitle("Don't have an account?", "Sign Up")
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

        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, helpWithSignInButton])
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

        // signUpbutton
//        signUpButton.centerX(inView: view)
//        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 8)

    }
    
}
