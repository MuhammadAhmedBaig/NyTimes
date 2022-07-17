//
//  NewsFeedView.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import UIKit

class NewsFeedView: UIViewController {
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addViews()
        self.setupConstraintsForBackView()
        
        self.setupTableView()
    }
    
    private func addViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
    }
    
    private func setupConstraintsForBackView() {
        let guideLine = self.view.safeAreaLayoutGuide
        
        self.tableView.topAnchor.constraint(equalTo: guideLine.topAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: guideLine.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: guideLine.rightAnchor).isActive = true
    }

    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.registerCells()
        self.tableView.reloadData()
    }
    
}

extension NewsFeedView: UITableViewDelegate, UITableViewDataSource {
    
    func registerCells() {
        self.tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.getIdentifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: NewsFeedCell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.getIdentifier(), for: indexPath) as? NewsFeedCell {
            cell.selectionStyle = .none
            cell.setupView()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
