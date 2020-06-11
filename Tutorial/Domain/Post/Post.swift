//
//  Post.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

struct Post: Hashable {
    let id: UUID = .init()
    let title: String
    let message: String
    let source: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PostDTO: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
    
    struct ArticleDTO: Decodable {
        let source: SourceDTO
        let title: String
        let description: String
        let urlToImage: String
        let publishedAt: String
        
        struct SourceDTO: Decodable {
            let name: String
        }
    }
}

struct PostDTOMapper {
    static func map(_ dto: PostDTO) -> [Post] {
        return dto.articles.map { Post(title: $0.title, message: $0.description, source: $0.source.name) }
    }
}
