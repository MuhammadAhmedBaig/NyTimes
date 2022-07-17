//
//  HelpersProtocols.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import Foundation
import UIKit

protocol IdentifiableCell {
    static func getIdentifier() -> String
}

extension IdentifiableCell {
    static var cellName: String {
        return String(describing: self)
    }

    static func getIdentifier() -> String {
        return self.cellName
    }
}
