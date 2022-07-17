//
//  Coordinator.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
