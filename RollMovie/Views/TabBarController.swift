//
//  TabBarController.swift
//  RollMovie
//
//  Created by Максим Мосалёв on 21.04.2023.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rollViewController = RollViewController()
        let favoritesViewController = FavoritesViewController()
        // Embed each view controller in a navigation controller
        let rollNavigationController = UINavigationController(rootViewController: rollViewController)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        
        // Set tab bar items
        rollNavigationController.tabBarItem = UITabBarItem(title: "Roll", image: UIImage(systemName: "film.stack"), tag: 0)
        favoritesNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        // Set view controllers
        self.setViewControllers([rollNavigationController, favoritesNavigationController], animated: false)
        
    }
}
