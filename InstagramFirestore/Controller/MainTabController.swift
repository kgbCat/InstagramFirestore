//
//  MainTabController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/12/22.
//

import UIKit
import Firebase


class MainTabController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        checkIfUserIsLoggedIn()
    }

    // MARK: - Helpers

    private func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginViewController()
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true)
            }
        }
    }

    private func configureViewControllers() {
        view.backgroundColor = .white

        let layout = UICollectionViewFlowLayout()

        let feedController = templateNavController(
            unselectedImage: Image.feedUnselected.image,
            selectedImage: Image.feedSelected.image,
            rootViewController: FeedController(collectionViewLayout: layout)
        )
        let searchController = templateNavController(
            unselectedImage: Image.searchUnselected.image,
            selectedImage: Image.searchSelected.image,
            rootViewController: SearchController()
        )
        let imageSelectorController = templateNavController(
            unselectedImage: Image.plusUnselected.image,
            selectedImage: Image.plusSelected.image,
            rootViewController: ImageSelectorController()
        )
        let notificationController = templateNavController(
            unselectedImage: Image.likeUnselected.image,
            selectedImage: Image.likeSelected.image,
            rootViewController: NotificationController()
        )

        let profileLayout = UICollectionViewFlowLayout()

        let profileController = templateNavController(
            unselectedImage: Image.profileUnselected.image,
            selectedImage: Image.profileSelected.image,
            rootViewController: ProfileController(collectionViewLayout: profileLayout)
        )

        viewControllers = [feedController, searchController, imageSelectorController, notificationController, profileController]

        tabBar.tintColor = .black
    }


   private func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.image = unselectedImage
        navigationVC.tabBarItem.selectedImage = selectedImage
        navigationVC.navigationBar.tintColor = .black
        return navigationVC
    }
}
