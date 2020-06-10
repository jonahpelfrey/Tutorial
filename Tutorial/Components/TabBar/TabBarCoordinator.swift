//
//  TabBarCoodinator.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        // Feature
        let featuredNavigationController = UINavigationController()
        featuredNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let featuredCoordinator = FeaturedCoordinator(navigationController: featuredNavigationController)
        
        // Settings
        let settingsNavigationController = UINavigationController()
        settingsNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        let settingsCoordinator = SettingsCoordinator(navigationController: settingsNavigationController)
        
        // Configure tab bar with controllers and presentation style
        tabBarController.viewControllers = [featuredNavigationController, settingsNavigationController]
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        // Initialize all coordinators within the tab bar
        coordinate(to: featuredCoordinator)
        coordinate(to: settingsCoordinator)
    }
}


