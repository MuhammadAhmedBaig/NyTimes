//
//  ImageViewExtension.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            //Not a valid URL
            return
        }
        downloadImage(from: url)
    }
    
    private func downloadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                //Unable to download Image
                return
            }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
}
