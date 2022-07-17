//
//  NewsFeedViewModelTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class NewsFeedViewModelTest: XCTestCase {

    var viewModel: NewsFeedViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let repository = NewsRepository(newsAPICalls: FakeNewsAPICalls())
        let useCase = GetNewsUseCase(repo: repository)
        viewModel = NewsFeedViewModel(useCase: useCase)
    }
    
    func testData() {
        viewModel?.getNewsFeeds()
        XCTAssert(viewModel?.getUIModelsCount() == 4)
        XCTAssert(viewModel?.getUIModel(atIndex: 1)?.auther == "Sunder Pichai")
    }

}
