//
//  FeedItemView.swift
//  BlogApp
//
//  Created by Artur Knul on 11/08/23.
//

import SwiftUI

struct FeedItemView: View {
    let feed: Feed
    var body: some View {
        VStack{
            if let url = URL(string: feed.user.profileImage.large) {
                FeedAsyncImageView(url: url)
                    .frame(maxHeight: 250)
                    .mask(RoundedRectangle(cornerRadius: 16))
                    .padding(3)
                
            }
            Divider()
                .padding(18)
            Group{
                createPairedView(key:"Name: ", value:"\(feed.user.firstName) \(feed.user.lastName ?? "")")
                
                createPairedView(key:"Bio: ", value:feed.user.bio ?? "-")
                
                createPairedView(key:"Location: ", value:feed.user.location ?? "-")
                
            }
            .padding(1)
            Spacer()
        }
        .frame(maxWidth: 350)
        .cornerRadius(9)
    }
    
    @ViewBuilder
    func createPairedView(key: String, value: String)-> some View {
        HStack(alignment:.center) {
            Text(key)
                .font(.headline)
                .frame(width: 150, alignment: .leading)
            Text(value)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            Spacer()
        }.padding()
    }
}

struct FeedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemView(feed: Feed.getMockFeed().first!)
    }
}
