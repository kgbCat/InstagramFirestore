//
//  RegisterViewController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/15/22.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Private Properties

    private var viewModel = RegisterViewModel()
    private var profilePhoto: UIImage?

    private let addPhotoButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "plus_photo"), for: .normal)
        bt.addTarget(self, action: #selector(handleProfilePhotoSelect), for: .touchUpInside)
        bt.tintColor = .white
        return bt
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
    private let fullNameTextField = CustomTextField(placeholder: "Fullname")
    private let userNameTextField = CustomTextField(placeholder: "Username")

    private let signUpButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setActionButton("Sign Up")
        bt.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return bt
    }()
    private let alreadyHaveAccountButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setAttributedTitle("Already have an acccount?", "Log in")
        bt.addTarget(self, action: #selector(navigateToLogIn), for: .touchUpInside)
        return bt
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNotificationOdservers()
    }


    // MARK: - Actions

    @objc func handleSignUp() {
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let fullname = fullNameTextField.text,
            let username = userNameTextField.text,
            let photo = profilePhoto
        else { return }

        let credentials = AuthCredentials(email: email, password: password, fullname: fullname, userName: username, photo: photo)
        AuthService.registerUser(withCredentials: credentials)
    }

    @objc func navigateToLogIn() {
        navigationController?.popViewController(animated: true)
    }

    @objc func textDidChange(sender: UITextField) {
        switch sender {
        case emailTextField:
            viewModel.email = sender.text
        case passwordTextField:
            viewModel.password = sender.text
        case fullNameTextField:
            viewModel.fullname = sender.text
        case userNameTextField:
            viewModel.username = sender.text
        default:
            print("Error: sender doesn't exist")
        }

        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.isFormValid
    }

    @objc func handleProfilePhotoSelect() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
}


    // MARK: - UIImagePickerControllerDelegate
extension RegisterViewController: UIImagePickerControllerDelegate,
                                  UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }

        profilePhoto = selectedImage

        addPhotoButton.layer.cornerRadius = addPhotoButton.frame.width / 2
        addPhotoButton.clipsToBounds = true
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        addPhotoButton.layer.borderWidth = 2
        addPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        dismiss(animated: true)
    }
}


// MARK: - Private Methods
private extension RegisterViewController {
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        setGradient()
        setPhotoButton()
        setupStackView()
        setalreadyHaveAccountButton()

    }
    func setPhotoButton() {
        view.addSubview(addPhotoButton)
        addPhotoButton.centerX(inView: view)
        addPhotoButton.setDimensions(height: 140, width: 140)
        addPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }

    func setupStackView() {
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, userNameTextField, signUpButton])
        view.addSubview(stack)
        stack.axis = .vertical
        stack.spacing = 20
        stack.centerX(inView: view)
        stack.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }

    func setalreadyHaveAccountButton() {
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }

    func configureNotificationOdservers() {

        [passwordTextField, fullNameTextField, userNameTextField, emailTextField].forEach({ tf in
            tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        })
    }
}
