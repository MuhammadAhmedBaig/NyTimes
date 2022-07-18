//
//  NewsFeedViewModelTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class NewsFeedViewModelTest: XCTestCase {
    
    func testSuccessCase() {
        let viewModel = NewsFeedViewModel(useCase: FakeGetNewsSuccessUseCase())
        viewModel.getNewsFeeds()
        XCTAssert(viewModel.getUIModelsCount() == 4)
        XCTAssert(viewModel.getUIModel(atIndex: 1)?.auther == "Sunder Pichai")
    }
    
    func testFailureCase() {
        let viewModel = NewsFeedViewModel(useCase: FakeGetNewsFailureUseCase())
        viewModel.getNewsFeeds()
        XCTAssert(viewModel.getUIModelsCount() == 0)
    }

}
