//
//  APIError.swift
//  BlogApp
//
//  Created by Artur Knul on 12/08/2023.
//

import Foundation

enum ApiCallError:Error {
    case invalidRequest
    case apiError
    case dataNotFound
    case responseError
    case parsingError
    case invalidResponse
}


