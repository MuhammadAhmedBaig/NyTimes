//
//  NYError.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation

struct NYError {
    let message: String

    init(message: String) {
        self.message = message
    }
}

extension NYError: LocalizedError {
    var errorDescription: String? { return message }
}
