//
//  GetNewsUseCaseTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class GetNewsUseCaseTest: XCTestCase {

    func testFetchDataSuccessCase() {
        let repository = NewsRepository(newsAPICalls: FakeSuccessNewsAPICalls())
        let useCase = GetNewsUseCase(repo: repository)
        useCase.execute { result in
            switch result {
            case .success(let newsList):
                XCTAssert(newsList.count == 4)
                XCTAssert(newsList.first?.auther == "Steve Jobs")
            case .failure(_):
                break
            }
        }
    }
    
    func testFetchDataFailureCAse() {
        let repository = NewsRepository(newsAPICalls: FakeFailureNewsAPICalls())
        let useCase = GetNewsUseCase(repo: repository)
        useCase.execute { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssert(error.localizedDescription == Constants.NetworkCallError.wentWrong.rawValue)
            }
        }
    }

}
