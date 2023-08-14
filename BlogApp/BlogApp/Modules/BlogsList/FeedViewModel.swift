//
//  FeedViewModel.swift
//  BlogApp
//
//  Created by Artur Knul on 11/08/23.
//

import Foundation

@MainActor
final class FeedViewModel: ObservableObject {
    
    @Published private(set) var feeds: [Feed] = []
    private let serviceManager: ApiManagerContract

    init(serviceManager: ApiManagerContract = ApiManager()) {
        self.serviceManager = serviceManager
    }
}

extension FeedViewModel {
    func getFeeds(feedRequest: FeedRequest) async {
        do {
            feeds = try await serviceManager.restApi(feedRequest, type: [Feed].self)
        } catch {
            feeds = []
        }
    }
}
