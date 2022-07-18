//
//  FakeNewsFeedData.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
@testable import NyTimesArticles

struct FakeData {
    static func makeFakeSuccessData() -> NewsModel {
        let mediaMetaData = MetaData(url: "https://www.apple.com")
        let media = Media(mediaMetadata: [mediaMetaData])
        let news = News(id: 1, url: "https://www.apple.com", title: "Apple News", auther: "Steve Jobs", publishedDate: "10-10-10", media: [media])
        let news1 = News(id: 2, url: "https://www.google.com", title: "Goole News", auther: "Sunder Pichai", publishedDate: "10-12-10", media: [media])
        let news2 = News(id: 3, url: "https://www.amazon.com", title: "Amazon News", auther: "Jeff Bezos", publishedDate: "10-01-11", media: [media])
        let news3 = News(id: 4, url: "https://www.twitter.com", title: "Twitter News", auther: "Bizz Stone", publishedDate: "10-02-11", media: [media])
        return NewsModel(results: [news, news1, news2, news3])
    }


    static func makeFakeFailureData() -> NYError {
        return NYError(message: Constants.NetworkCallError.wentWrong.rawValue)
    }
}
