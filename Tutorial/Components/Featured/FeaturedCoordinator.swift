//
//  HomeCoordinator.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

protocol FeaturedFlow: class {
    func coordinateToDetail(post: Post)
}

class FeaturedCoordinator: Coordinator, FeaturedFlow {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let featuredViewController = FeaturedViewController()
        featuredViewController.coordinator = self
        featuredViewController.title = "News"
        navigationController.pushViewController(featuredViewController, animated: false)
    }
    
    func coordinateToDetail(post: Post) {
        let featuredDetailViewController = FeaturedDetailViewController()
        featuredDetailViewController.title = post.source
        navigationController.pushViewController(featuredDetailViewController, animated: true)
    }
}
