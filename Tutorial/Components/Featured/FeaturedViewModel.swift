//
//  FeaturedViewModel.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation
import Combine

protocol FeatureProvider: class {
    func didFinishLoading()
}

class FeaturedViewModel {
    
    var posts = CurrentValueSubject<[Post], Never>([])
    weak var delegate: FeatureProvider?
    
    init() {
        refreshPosts()
    }
    
    func refreshPosts() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        PostService.fetch { (result) in
            switch result {
            case .failure(let error):
                print("Failure: \(error)")
            case .success(let posts):
                self.delegate?.didFinishLoading()
                self.posts.send(posts)
            }
        }
    }
}
