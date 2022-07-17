//
//  NewsDetailsCoordinator.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
import UIKit

class NewsDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController
    var dependencies: Dependencies
    
    struct Dependencies {
        var urlString: String
    }

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let vc: NewsDetailView = NewsDetailView(viewModel: makeNewsDetailViewModel())
        DispatchQueue.main.async {
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    private func makeNewsDetailViewModel() -> NewsDetailViewModel {
        return NewsDetailViewModel(urlString: self.dependencies.urlString)
    }
    
}
