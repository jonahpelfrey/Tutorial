//
//  PostService.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

class PostService {
    typealias PostResult = (Result<[Post], NetworkError>) -> Void
    
    static func fetch(completion: @escaping PostResult) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.response))
                return
            }
            guard let data = data else {
                completion(.failure(.data))
                return
            }
            do {
                let decoder = JSONDecoder()
                let postDTO = try decoder.decode([PostDTO].self, from: data)
                completion(.success(PostDTOMapper.map(postDTO)))
            } catch {
                completion(.failure(.parsing))
            }
        }.resume()
    }
}
