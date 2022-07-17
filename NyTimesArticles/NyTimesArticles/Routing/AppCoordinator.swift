//
//  AppCoordinator.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc: NewsFeedView = NewsFeedView(viewModel: self.makeNewsFeedViewModel())
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    private func makeNewsFeedViewModel() -> NewsFeedViewModel {
        return NewsFeedViewModel(useCase: makeGetNewsUseCase())
    }
    
    private func makeGetNewsUseCase() -> GetNewsUseCase {
        return GetNewsUseCase(repo: makeNewsRepository())
    }
    
    private func makeNewsRepository() -> NewsFeedRepoProtocol {
        return NewsRepository(newsAPICalls: makeAPICallsRepo())
    }
    
    private func makeAPICallsRepo() -> GetNewsAPIProtocol {
        return NewsAPICalls()
    }
    
    func showNewsDetails(with urlString: String) {
        let coordinator = NewsDetailsCoordinator(navigationController: self.navigationController,
                                                 dependencies: NewsDetailsCoordinator.Dependencies(urlString: urlString))
        coordinator.start()
    }
}
