//
//  ContentView.swift
//  BlogApp
//
//  Created by Artur Knul on 10/08/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack{
            if viewModel.feeds.count > 0 {
                ScrollView(.horizontal){
                    LazyHStack {
                        ForEach(viewModel.feeds){ feed in
                            NavigationLink {
                                FeedItemDetailsView(feed: feed)
                            } label: {
                                FeedItemView(feed: feed)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.purple, lineWidth: 2)
                                    )
                                    .frame(maxHeight: .infinity)
                                    .padding()
                            }
                        }
                    }
                }
            }else{
                Text("Loading..")
            }
        }
        .navigationTitle(Text("Blogs"))
        .task{
            let feedRequest = FeedRequest(path:EndPoints.path, type: "GET")
            await viewModel.getFeeds(feedRequest: feedRequest)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
