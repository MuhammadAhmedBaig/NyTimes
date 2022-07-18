//
//  NewsFeedIntegrationTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class NewsFeedIntegrationTest: XCTestCase {
    
    func testSuccessIntegration() {
        let repository = NewsRepository(newsAPICalls: FakeSuccessNewsAPICalls())
        let useCase = GetNewsUseCase(repo: repository)
        let viewModel = NewsFeedViewModel(useCase: useCase)
        viewModel.getNewsFeeds()
        XCTAssert(viewModel.getUIModelsCount() == 4)
        XCTAssert(viewModel.getUIModel(atIndex: 1)?.auther == "Sunder Pichai")
    }
    
    func testFailureIntegration() {
        let repository = NewsRepository(newsAPICalls: FakeFailureNewsAPICalls())
        let useCase = GetNewsUseCase(repo: repository)
        let viewModel = NewsFeedViewModel(useCase: useCase)
        viewModel.getNewsFeeds()
        XCTAssert(viewModel.getUIModelsCount() == 0)
    }
}
