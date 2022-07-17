//
//  NewsAPICalls.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation

protocol GetNewsAPIProtocol {
    func getNews(for section: String, period: String, completion: @escaping (Result<NewsModel, NYError>) -> Void)
}

class NewsAPICalls: GetNewsAPIProtocol {
    private var network: NetworkProtocol
    
    init(networkProtocol: NetworkProtocol = NetworkLayer()) {
        self.network = networkProtocol
    }
    
    func getNews(for section: String, period: String, completion: @escaping (Result<NewsModel, NYError>) -> Void) {
        let newtorkConfig = APINetworkConfig(baseURL: Constants.API.baseURL.rawValue,
                                             urlAppending: makeURLAppending(section: section, period: period),
                                             queryParameters: makeQueryParam(),
                                             method: .get)
        
        guard let urlRequest = RequestMaker.urlRequest(with: newtorkConfig) else {
            completion(.failure(NYError(message: Constants.NetworkCallError.wentWrong.rawValue)))
            return
        }
        network.executeGetAPI(withURLRequest: urlRequest, completion: completion)
    }
    
    private func makeURLAppending(section: String, period: String) -> String {
        //Making of "/mostpopular/v2/mostviewed/all-sections/7.json"
        return "\(Constants.API.URLAppending.category.rawValue)/\(Constants.API.URLAppending.versionNumber.rawValue)/\(Constants.API.URLAppending.mostViewed.rawValue)/\(section)/\(period)"
    }
    
    private func makeQueryParam() -> [String: String] {
        return [Constants.API.QueryParam.apiKeyParam.rawValue: Constants.API.key.rawValue]
    }
}
