//
//  FeaturedViewModel.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation
import Combine

class FeaturedViewModel {
    
    var posts = CurrentValueSubject<[Post], Never>([])
    
    init() {
        loadPosts()
    }
    
    func loadPosts() {
        PostService.fetch { (result) in
            switch result {
            case .failure(let error):
                print("Failure: \(error)")
            case .success(let posts):
                self.posts.send(posts)
            }
        }
    }
}
