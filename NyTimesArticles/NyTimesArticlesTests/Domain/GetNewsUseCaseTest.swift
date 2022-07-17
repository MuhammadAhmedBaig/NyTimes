//
//  GetNewsUseCaseTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class GetNewsUseCaseTest: XCTestCase {

    var useCase: GetNewsUseCase?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let repository = NewsRepository(newsAPICalls: FakeNewsAPICalls())
        useCase = GetNewsUseCase(repo: repository)
    }
    
    func testFetchData() {
        useCase?.execute { result in
            switch result {
            case .success(let newsList):
                XCTAssert(newsList.count == 4)
                XCTAssert(newsList.first?.auther == "Steve Jobs")
            case .failure(let error):
                break
            }
        }
    }

}
