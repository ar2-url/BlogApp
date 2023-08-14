//
//  FeedItemDetailsView.swift
//  BlogApp
//
//  Created by Artur Knul on 14/08/2023.
//


import SwiftUI

struct FeedItemDetailsView: View {
    let feed: Feed
    var body: some View {
        VStack {
            ScrollView {
                Text("\(feed.user.name)".capitalized)
                    .foregroundColor(.cyan)
                    .font(.headline)
                if let url = URL(string: feed.user.links.html) {
                    Link(destination:url, label: {
                        Text(feed.user.links.html)
                    })
                    .padding()
                }
              
                if let url = URL(string: feed.user.profileImage.large){
                    FeedAsyncImageView(url: url)
                        .frame(width: 180, height: 180)
                        .mask(RoundedRectangle(cornerRadius: 16))
                }
                Divider()
                Group {
                
                    PairedView(key:"Description", value: feed.description ?? "-")

                    PairedView(key:"Alternative Desc", value: feed.altDescription ?? "-")
                    PairedView(key:"Bio", value: feed.user.bio ?? "-")
                    
                    PairedView(key:"Instagram Username", value: feed.user.instagramUsername ?? "-")
                    
                    PairedView(key:"Portfolio Link", value: feed.user.portfolioURL ?? "-")
                    
                   

                }.padding(3)
            }.padding()
        }
        .cornerRadius(9)
    }
}

struct FeedItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemDetailsView(feed: Feed.getMockFeed().first!)
    }
}
