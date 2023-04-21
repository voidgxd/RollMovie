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

           // Set tab bar items
           rollViewController.tabBarItem = UITabBarItem(title: "Roll", image: UIImage(systemName: "film.stack"), tag: 0)
           favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)

           // Set view controllers
           self.setViewControllers([rollViewController, favoritesViewController], animated: false)

       }
   }

