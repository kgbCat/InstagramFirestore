//
//  MainTabController.swift
//  InstagramFirestore
//
//  Created by Anna Delova on 10/12/22.
//

import UIKit


class MainTabController: UITabBarController {

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }

    // MARK: - Helpers

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
        let profileController = templateNavController(
            unselectedImage: Image.profileUnselected.image,
            selectedImage: Image.profileSelected.image,
            rootViewController: ProfileController()
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
