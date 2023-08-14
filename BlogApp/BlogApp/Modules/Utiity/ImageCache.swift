//
//  ImageCache.swift
//  BlogApp
//
//  Created by Artur Knul on 12/08/2023.
//

import Foundation
import SwiftUI

final class ImageCache {
    static private var cache: [URL: Image] = [:]
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
