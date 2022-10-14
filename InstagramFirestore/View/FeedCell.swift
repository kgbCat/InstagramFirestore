//
//  FeedCell.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/12/22.
//

import UIKit

class FeedCell: UICollectionViewCell {

    // MARK: - Properties

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "venom-7")
        return imageView
    }()

    private lazy var userNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("venom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "venom-7")
        return imageView
    }()

    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "like_unselected"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()

    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()

    private lazy var repostButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "send2"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "3 likes"
        return label
    }()

    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Something..."
        return label
    }()

    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 hours ago"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        return label
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Actions

    @objc func didTapUsername() {
        print("UserName Tapped")
    }

    // MARK: Helpers

    private func setUI() {
        backgroundColor = .white

        addSubview(profileImageView)
        profileImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            paddingTop: 12,
            paddingLeft: 12)

        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2.0

        addSubview(userNameButton)
        userNameButton.centerY(
            inView: profileImageView,
            leftAnchor: profileImageView.rightAnchor,
            paddingLeft: 8)

        addSubview(postImageView)
        postImageView.anchor(
            top: profileImageView.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingTop: 8)

        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true

        configureButtons()

        configureLabels()
    }

    private func configureButtons() {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, repostButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        addSubview(stackView)
        stackView.anchor(
            top: postImageView.bottomAnchor,
            left: leftAnchor,
            paddingLeft: 8,
            width: 120,
            height: 50)
    }

    private func configureLabels() {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, captionLabel, postTimeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        addSubview(stackView)
        stackView.anchor(
            top: likeButton.bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            paddingLeft: 8,
            paddingRight: 8,
            height: 60
            )
    }
}
