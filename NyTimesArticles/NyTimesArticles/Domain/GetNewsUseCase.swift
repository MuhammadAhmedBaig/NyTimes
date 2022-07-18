//
//  GetNewsUseCase.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 17/07/2022.
//

import Foundation

protocol GetNewsUseCaseProtocol {
    func execute(completion: @escaping (Result<[News], NYError>) -> Void)
}

class GetNewsUseCase: GetNewsUseCaseProtocol {
    private let repo: NewsFeedRepoProtocol
    
    init(repo: NewsFeedRepoProtocol = NewsRepository()) {
        self.repo = repo
    }
    
    func execute(completion: @escaping (Result<[News], NYError>) -> Void) {
        self.repo.getNews { (result) in
            switch result {
            case .success(let model):
                completion(.success(model.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
