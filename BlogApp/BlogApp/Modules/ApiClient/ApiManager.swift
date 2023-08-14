//
//  APIManager.swift
//  BlogApp
//
//  Created by Artur Knul on 12/08/2023.
//


import Foundation

protocol ApiManagerContract {
    func restApi<T: Decodable>(_ request: Requestable, type: T.Type) async throws -> T
}

class ApiManager {
    private let urlSession: URLSession
    lazy private var decoder: JSONDecoder =  {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
}

extension ApiManager: ApiManagerContract {
    func restApi<T>(_ request: Requestable, type: T.Type) async throws -> T where T : Decodable {
        guard let urlRequest = request.createUrlRequest() else {
            throw ApiCallError.invalidRequest
        }
        do {
            let (data, response) = try await urlSession.data(for: urlRequest, delegate: nil)
            if  response.isValidResponse() {
                return try decoder.decode(type.self, from: data)
            } else {
                throw ApiCallError.invalidResponse
            }
        } catch {
            throw error
        }
    }
}

extension URLResponse {
    func isValidResponse()-> Bool {
        guard let response = self as? HTTPURLResponse else {
            return false
        }
        switch response.statusCode {
        case 200...299:
          return true
        default:
          return false
        }
    }
}
