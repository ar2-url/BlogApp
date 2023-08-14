//
//  FeedViewModelTests.swift
//  BlogAppTests
//
//  Created by Artur Knul on 14/08/23.
//

import XCTest
@testable import BlogApp

final class FeedViewModelTests: XCTestCase {

    let fakeService = FakeServiceManager()
    var feedViewModel: FeedViewModel!

    @MainActor override func setUp() {
        feedViewModel = FeedViewModel(serviceManager: fakeService)
    }
    override func tearDown() {
       feedViewModel = nil
    }
    
    @MainActor func testGetFeedsSuccess() async {
        let feedRequest = FeedRequest(path:EndPoints.path, type: "GET")
        await feedViewModel.getFeeds(feedRequest: feedRequest)

        XCTAssertEqual(feedViewModel.feeds.count, 1)
        XCTAssertEqual(feedViewModel.feeds.first!.description!, "Amongst expansive red sands and spectacular sandstone rock formations, Hisma Desert – NEOM, Saudi Arabia | The NEOM Nature Reserve region is being designed to deliver protection and restoration of biodiversity across 95% of NEOM.")

    }
    
    @MainActor func testGetFeedsFailure() async {
        let feedRequest = FeedRequest(path:"", type: "GET")
        await feedViewModel.getFeeds(feedRequest: feedRequest)

        XCTAssertEqual(feedViewModel.feeds.count, 0)
    }
}

class FakeServiceManager: ApiManagerContract {
    func restApi<T>(_ request: BlogApp.Requestable, type: T.Type) async throws -> T where T : Decodable {
        if request.path == "photos/" {
            return Feed.getMockFeed() as! T
        }
        throw ApiCallError.apiError
    }
}
