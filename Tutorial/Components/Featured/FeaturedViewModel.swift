//
//  FeaturedViewModel.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation
import Combine

struct User {
    let jobTitle: String
    let firstName: String
    let lastName: String
    let address: String
    let phoneNumber: Int
}

class UserViewModel {
    let users: [User]
    
    init(users: [User]) {
        self.users = users
    }
    
    func getRawUsers() -> [User] {
        return self.users
    }
    
//    func getUsers() -> [ViewableUser] {
//        return self.users.map({$0.jobTitle})
//    }
}

protocol ViewableFeature {
    // This would outline a way to massage the Domain Feature type to an object suitable for the view controller
}

class FeaturedViewModel {
    
    var features = CurrentValueSubject<[Feature], Never>([])
    
    init() {
        self.features.send(FeatureService.seed())
    }
    
    func loadFeatures() {
        FeatureService.fetch { (result) in
            switch result {
            case .failure(let error):
                print("Failure: \(error)")
                
            case .success(let features):
                print("Success: \(features)")
            }
        }
    }
}
