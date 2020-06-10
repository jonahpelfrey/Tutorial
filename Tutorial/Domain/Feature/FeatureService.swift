//
//  FeatureService.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

final class FeatureService {
    
    typealias FeatureResult = (Result<[Feature], NetworkError>) -> Void
    
    static func fetch(completion: @escaping FeatureResult) {
        let url = URL(string: "https://www.google.com")!
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
                let decoded = try decoder.decode([Feature].self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.parsing))
            }
        }.resume()
    }
    
    static func seed() -> [Feature] {
        return [
            Feature(title: "A"),
            Feature(title: "B"),
            Feature(title: "C"),
            Feature(title: "D"),
            Feature(title: "E")
        ]
    }
}
