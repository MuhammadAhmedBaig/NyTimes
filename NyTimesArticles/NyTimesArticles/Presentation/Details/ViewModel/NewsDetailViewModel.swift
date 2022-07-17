//
//  NewsDetailViewModel.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation

protocol NewsDetailViewModelDelegate: AnyObject {
    func load(URLRequest request: URLRequest)
    func show(Error msg: String)
}

class NewsDetailViewModel {
    let urlString: String
    weak var delegate: NewsDetailViewModelDelegate?
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func resolveAndShowDetails() {
        guard let url = URL(string: urlString) else {
            self.delegate?.show(Error: Constants.Error.invalidURL.rawValue)
            return
        }
        self.delegate?.load(URLRequest: URLRequest(url: url))
    }
}
