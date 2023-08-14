//  Request.swift
//  BlogApp
//
//  Created by Artur Knul on 12/08/2023.
//

import Foundation

protocol Requestable {
    var baseUrl: String {get}
    var path: String {get set}
    var params: [String: String] {get}
    var type: String {get}
    var header: [String: String] {get}
    func createUrlRequest() -> URLRequest?
}

extension Requestable {
    var baseUrl: String {
        return EndPoints.baseUrl
    }
    var params: [String: String] {
        return [:]
    }
    var type: String {
        return ""
    }
    var header: [String: String] {
        return [:]
    }
    
    func createUrlRequest() -> URLRequest? {
        guard baseUrl.count > 0, path.count > 0 else { return nil }
        var urlComponnets = URLComponents(string: baseUrl + path)
        
        if type == "GET" {
            var queryItems: [URLQueryItem] = []
            for (key, value) in params {
                queryItems.append( URLQueryItem(name: key, value: value))
            }
            urlComponnets?.queryItems = queryItems
        }
      
       
        guard let url = urlComponnets?.url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type
        if type == "POST" {
            let jsonData = try? JSONEncoder().encode(params)
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = jsonData
        }
        return urlRequest
    }
}

