//
//  MainCoordinator.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

protocol EntryFlow: class {
    func coordinateToTabBar()
}

class EntryCoordinator: Coordinator, EntryFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainViewController = EntryViewController()
        mainViewController.coordinator = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func coordinateToTabBar() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        coordinate(to: tabBarCoordinator)
    }
}
