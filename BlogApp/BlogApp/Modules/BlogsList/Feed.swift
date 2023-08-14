//
//  Feed.swift
//  BlogApp
//
//  Created by Artur Knul on 11/08/23.
//

import Foundation

// MARK: - Feed
struct Feed: Decodable, Identifiable {
    let id: String
    let description: String?
    let altDescription: String?
    let urls: Urls
    let links: FeedLinks
    let likes: Int
    let likedByUser: Bool
    let sponsor: Sponsorship?
    let user: User
    let createdAt: String
    let updatedAt: String
}

struct FeedLinks: Decodable {
    let html, download, downloadLocation: String
}

struct Sponsorship: Decodable {
   let impressionUrls: [String]
    let tagline: String
    let taglineUrl: String
    let sponsor: User
}

struct User: Decodable, Identifiable {
    let id: String
    let username, name, firstName: String
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks
    let profileImage: ProfileImage
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int
    let acceptedTos, forHire: Bool
    let social: Social
}

struct UserLinks: Decodable {
    let html, photos, likes: String
    let portfolio, following, followers: String
}

struct ProfileImage: Decodable {
    let small, medium, large: String
}

struct Social: Decodable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?
}

struct TexturesPatterns: Decodable {
    let status: String
    let approvedOn: Date?
}

struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb, smallS3: String
}

