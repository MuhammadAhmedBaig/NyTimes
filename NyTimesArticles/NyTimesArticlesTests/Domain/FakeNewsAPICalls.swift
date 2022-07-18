//
//  FakeNewsAPICalls.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
@testable import NyTimesArticles

class FakeSuccessNewsAPICalls: GetNewsAPIProtocol {
    func getNews(for section: String, period: String, completion: @escaping (Result<NewsModel, NYError>) -> Void) {
        completion(.success(FakeData.makeFakeSuccessData()))
    }
}

class FakeFailureNewsAPICalls: GetNewsAPIProtocol {
    func getNews(for section: String, period: String, completion: @escaping (Result<NewsModel, NYError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
