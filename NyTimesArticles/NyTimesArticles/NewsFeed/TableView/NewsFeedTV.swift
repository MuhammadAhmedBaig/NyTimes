//
//  NewsFeedTV.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import UIKit

protocol NewsFeedTVProtocol: AnyObject {
    func newsFeedTapped(atIndex index: Int)
}

class NewsFeedTV: UITableView, UITableViewDelegate, UITableViewDataSource {
    var data = [String]()
    weak var tvProtocol: NewsFeedTVProtocol?
    
    func setupAndLoad(tvProtocol: NewsFeedTVProtocol?,
                      dataObjects: [String]) {
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
        self.tvProtocol = tvProtocol
        self.data = dataObjects
        self.registerCells()
        self.reloadData()
    }
    
    func registerCells() {
        self.register(NewsFeedCell.getNib(), forCellReuseIdentifier: NewsFeedCell.getIdentifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: NewsFeedCell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.getIdentifier(), for: indexPath) as? NewsFeedCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
