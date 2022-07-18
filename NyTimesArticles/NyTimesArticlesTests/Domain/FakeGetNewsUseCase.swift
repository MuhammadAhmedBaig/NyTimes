//
//  FakeGetNewsUseCase.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
@testable import NyTimesArticles

class FakeGetNewsSuccessUseCase: GetNewsUseCaseProtocol {
    func execute(completion: @escaping (Result<[News], NYError>) -> Void) {
        completion(.success(FakeData.makeFakeSuccessData().results))
    }
}

class FakeGetNewsFailureUseCase: GetNewsUseCaseProtocol {
    func execute(completion: @escaping (Result<[News], NYError>) -> Void) {
        completion(.failure(FakeData.makeFakeFailureData()))
    }
}
