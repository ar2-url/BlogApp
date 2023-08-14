//
//  Feed+Mock.swift
//  BlogApp
//
//  Created by Artur Knul on 14/08/23.
//

import Foundation


extension Feed {
    static func getMockFeed()-> [Feed] {
        return [Feed(id: "1", description: "Amongst expansive red sands and spectacular sandstone rock formations, Hisma Desert – NEOM, Saudi Arabia | The NEOM Nature Reserve region is being designed to deliver protection and restoration of biodiversity across 95% of NEOM.", altDescription: "a man standing on top of a sandy hill", urls: Urls(raw: "", full: "", regular: "", small: "", thumb: "", smallS3: ""), links: FeedLinks(html: "", download: "", downloadLocation: ""), likes: 10, likedByUser: false, sponsor: Sponsorship(impressionUrls: [], tagline: "", taglineUrl: "", sponsor: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 6, totalLikes: 12, totalPhotos: 7, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: ""))), user: User(id: "", username: "", name: "", firstName: "", lastName: "", twitterUsername: "", portfolioURL: "", bio: "", location: "", links: UserLinks(html: "", photos: "", likes: "", portfolio: "", following: "", followers: ""), profileImage: ProfileImage(small: "", medium: "", large: ""), instagramUsername: "", totalCollections: 3, totalLikes: 3, totalPhotos: 3, acceptedTos: false, forHire: false, social: Social(instagramUsername: "", portfolioURL: "", twitterUsername: "")), createdAt: "", updatedAt: "")]
    }
}
