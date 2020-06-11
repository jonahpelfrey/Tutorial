//
//  Post.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

struct Post: Hashable {
    let user: Int
    let id: Int
    let title: String
    let message: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
        hasher.combine(id)
    }
}

struct PostDTO: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct PostDTOMapper {
    static func map(_ dto: PostDTO) -> Post {
        return Post(user: dto.userId, id: dto.id, title: dto.title, message: dto.body)
    }
    static func map(_ dtos: [PostDTO]) -> [Post] {
        return dtos.map({Post.init(user: $0.userId, id: $0.id, title: $0.title, message: $0.body)})
    }
}
