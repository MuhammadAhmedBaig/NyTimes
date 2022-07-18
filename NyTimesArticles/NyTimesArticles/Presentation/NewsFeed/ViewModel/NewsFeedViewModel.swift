//
//  NewsFeedViewModel.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import Foundation
import UIKit

protocol NewsFeedVMDelegate: AnyObject {
    func sucessWhileFetchingData()
    func show(error msg: String)
    func moveToDetails(withURLString urlStr: String)
}

class NewsFeedViewModel {
    
    weak var delegate: NewsFeedVMDelegate?
    private var useCase: GetNewsUseCaseProtocol
    private var uiModels = [NewsUIModel]()
    
    init(useCase: GetNewsUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getNewsFeeds() {
        self.useCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let newsList):
                self.makeUIModels(newsList: newsList)
            case .failure(let error):
                self.delegate?.show(error: error.localizedDescription)
            }
        }
    }
    
    private func makeUIModels(newsList: [News]) {
        defer {
            self.delegate?.sucessWhileFetchingData()
        }
        
        for news in newsList {
            uiModels.append(NewsUIModel(imageURL: news.media.first?.mediaMetadata.first?.url ?? "",
                                        title: news.title,
                                        auther: news.auther,
                                        date: news.publishedDate,
                                        detailsUrl: news.url))
        }
    }
    
    func getUIModelsCount() -> Int {
        return uiModels.count
    }
    
    func getUIModel(atIndex index: Int) -> NewsUIModel? {
        return uiModels.count > index ? uiModels[index] : nil
    }
    
    func didTapOnItem(atIndex index: Int) {
        guard let urlStr = self.getUIModel(atIndex: index)?.detailsUrl else {
            return
        }
        self.delegate?.moveToDetails(withURLString: urlStr)
    }
}
