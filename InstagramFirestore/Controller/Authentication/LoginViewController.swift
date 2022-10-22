//
//  LoginViewController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/15/22.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties

    private var viewModel = LoginViewModel()

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
        bt.setActionButton("Log In")
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
        bt.addTarget(self, action: #selector(navigateToSignUp), for: .touchUpInside)
        return bt
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setGradient()
        configureUI()
        configureNotificationOdservers()
    }

    // MARK: - Actions

    @objc func navigateToSignUp() {
        let registrationVc = RegisterViewController()
        navigationController?.pushViewController(registrationVc, animated: true)
    }

    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }

        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.isFormValid
    }

}

private extension LoginViewController {
    // MARK: - Private Methods
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black

        setIconImage()
        setStackView()
        setSignUpButon()
    }

    func setIconImage() {
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

    }

    func setStackView() {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, helpWithSignInButton])
        view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 20
        stack.centerX(inView: view)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }

    func setSignUpButon() {
        view.addSubview(signUpButton)
        signUpButton.centerX(inView: view)
        signUpButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

    func configureNotificationOdservers() {

        [passwordTextField, emailTextField].forEach({ tf in
            tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        })
    }
}
