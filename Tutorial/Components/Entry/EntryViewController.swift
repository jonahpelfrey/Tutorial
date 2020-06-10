//
//  MainViewController.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    var coordinator: EntryFlow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .systemBlue
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.coordinator?.coordinateToTabBar()
        }
    }
}
