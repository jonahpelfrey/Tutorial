//
//  Feature.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

struct Feature: Hashable, Decodable {
    let title: String
}

struct Featurez: Hashable, Decodable {
    let id: UUID = UUID()
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct FeatureDTO: Decodable {
    
}
