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
        
        // Initialize root view controllers
        let featuredNavigationController = UINavigationController()
        featuredNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let featuredCoordinator = FeaturedCoordinator(navigationController: featuredNavigationController)
        
        // Configure tab bar with controllers and presentation style
        tabBarController.viewControllers = [featuredNavigationController]
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        // Initialize all coordinators within the tab bar
        coordinate(to: featuredCoordinator)
    }
}


