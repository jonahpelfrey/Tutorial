//
//  SettingsCoordinator.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

class SettingsCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        navigationController.pushViewController(settingsViewController, animated: false)
    }
}
