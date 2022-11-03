//
//  ProfileHeader.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 11/3/22.
//

import UIKit

class ProfileHeader : UICollectionReusableView {

    // MARK: - Properties

    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "venom-7")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bugs Bunny"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profle", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleEditProfileButton), for: .touchUpInside)
        return button
    }()

    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedText(value: 9, label: "posts")
        return label
    }()

    private lazy var followerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedText(value: 1, label: "followers")
        return label
    }()

    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedText(value: 1, label: "following")
        return label
    }()

    private let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Image.grid.image, for: .normal)
        return button
    }()

    private let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Image.list.image, for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()

    private let bookMarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(Image.bookMark.image, for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()

    private lazy var labelStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postLabel, followerLabel, followingLabel])
        stack.distribution  = .fillEqually
        return stack
    }()

    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [gridButton, listButton, bookMarkButton])
        stack.distribution  = .fillEqually
        return stack
    }()

    private let topDivider: UIView = {
        let div = UIView()
        div.backgroundColor = .lightGray
        return div
    }()

    private let bottomDivider: UIView = {
        let div = UIView()
        div.backgroundColor = .lightGray
        return div
    }()


    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white

        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(editProfileButton)
        addSubview(labelStack)
        addSubview(topDivider)
        addSubview(bottomDivider)
        addSubview(buttonStack)

        setConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }


    // MARK: - Actions

    @objc func handleEditProfileButton() {

    }
}

private extension ProfileHeader {

    // MARK: - Private Methods

   func attributedText(value: Int, label: String) -> NSAttributedString {

       let attributtedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])

       attributtedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))

       return attributtedText
   }

   func setConstrains() {
       profileNameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)

       profileImageView.anchor(top: topAnchor,left: leftAnchor, paddingTop: 16, paddingLeft: 12)
       profileImageView.setDimensions(height: 80, width: 80)

       editProfileButton.anchor(top: profileNameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 24, paddingRight: 24)

       labelStack.centerY(inView: profileImageView)
       labelStack.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12, height: 50)

       buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)

       topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)

       bottomDivider.anchor(left: leftAnchor, bottom: buttonStack.bottomAnchor, right: rightAnchor, height: 0.5)
   }
}
