//
//  NewsDetailViewModelTest.swift
//  NyTimesArticlesTests
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import XCTest
@testable import NyTimesArticles

class NewsDetailViewModelTest: XCTestCase {

    func testSuccessCase() {
        let viewModel = NewsDetailViewModel(urlString: "https://www.google.com/")
        XCTAssert(viewModel.generateRequest() != nil)
    }
    
    func testFailureCase() {
        let viewModel = NewsDetailViewModel(urlString: "invalidurl or simple text")
        XCTAssert(viewModel.generateRequest() == nil)
    }

}
