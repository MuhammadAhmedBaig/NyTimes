//
//  NewsModel.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 17/07/2022.
//

import Foundation

struct NewsModel: Decodable {
    var results: [News]
}

struct News: Decodable {
    var id: Int
    var url: String
    var title: String
    var auther: String
    var publishedDate: String
    
    var media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case id, url, title, media
        case auther = "byline"
        case publishedDate = "published_date"
    }
}

struct Media: Decodable {
    var mediaMetadata: [MetaData]
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MetaData: Decodable {
    var url: String
}
