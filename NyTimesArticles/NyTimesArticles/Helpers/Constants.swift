//
//  Constants.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation

enum Constants {
    enum API: String {
        case baseURL = "https://api.nytimes.com/svc/"
        case key = "juGcJkhEJsPY3Y1jctJDGAri4sMfH0DR"
        enum QueryParam: String {
            case apiKeyParam = "api-key"
        }
        enum URLAppending: String {
            case category = "mostpopular"
            case versionNumber = "v2"
            case mostViewed = "mostviewed"
            case allSections = "all-sections"
            case pathValue = "7.json"
        }
    }
    
    enum NetworkCallError: String {
        case wentWrong = "Something went wrong, please try again later."
        case parsingError = "Unable to parse data."
    }
    
    enum Error: String {
        case invalidURL = "URL seems to be not correct."
    }
    
    enum ScreenTitle: String {
        case homeTitle = "NY Times Articles"
    }
}
