//
//  NewsFeedView.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import UIKit

class NewsFeedView: UIViewController {
    
    var tableView: NewsFeedTV = {
        let tv = NewsFeedTV()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

