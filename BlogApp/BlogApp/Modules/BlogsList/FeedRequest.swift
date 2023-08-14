//
//  FeedRequest.swift
//  BlogApp
//
//  Created by Artur Knul on 11/08/23.
//

import Foundation

struct FeedRequest: Requestable {
    var path: String
    var type: String
    var params: [String : String] {
        return ["client_id": EndPoints.clientId]
    }
}
