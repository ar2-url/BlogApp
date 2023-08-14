//
//  FeedAsyncImageView.swift
//  BlogApp
//
//  Created by Artur Knul on 12/08/2023.
//


import SwiftUI

struct FeedAsyncImageView: View {
    let url: URL
    var body: some View {
        CacheAsyncImage(
            url: url) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                case .failure(let error):
                    Text(error.localizedDescription)
                case .empty:
                    HStack(alignment: .center) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        Spacer()
                    }
                @unknown default:
                    Image(systemName: "questionmark")
                }
            }
    }
}

struct FeedAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        FeedAsyncImageView(url: URL(string: "https://images.unsplash.com/profile")!)
    }
}
