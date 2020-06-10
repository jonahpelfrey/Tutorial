//
//  NetworkError.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case response
    case data
    case parsing
}
