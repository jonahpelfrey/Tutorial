//
//  FeaturedViewModel.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation
import Combine

protocol ViewableFeature {
    
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
