//
//  NewsRepository.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 17/07/2022.
//

import Foundation

protocol NewsFeedRepoProtocol {
    func getNews(completion: @escaping (Result<NewsModel, NYError>) -> Void)
}

class NewsRepository: NewsFeedRepoProtocol {
    private var newsAPIs: GetNewsAPIProtocol
    
    init(newsAPICalls: GetNewsAPIProtocol = NewsAPICalls()) {
        self.newsAPIs = newsAPICalls
    }
    
    func getNews(completion: @escaping (Result<NewsModel, NYError>) -> Void) {
        self.newsAPIs.getNews(for: Constants.API.URLAppending.allSections.rawValue,
                                 period: Constants.API.URLAppending.pathValue.rawValue,
                                 completion: completion)
    }
}


