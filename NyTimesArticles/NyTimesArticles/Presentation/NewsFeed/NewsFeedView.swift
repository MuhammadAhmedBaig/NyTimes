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
    
    var viewModel: NewsFeedViewModel
    var coordinator: AppCoordinator?
    
    init(viewModel: NewsFeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addViews()
        self.setupConstraintsForBackView()
        
        self.setupNavTitle()
        self.setupTableView()
        
        self.fetchData()
    }
    
    private func fetchData() {
        viewModel.getNewsFeeds()
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
    
    private func setupNavTitle() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        title = Constants.ScreenTitle.homeTitle.rawValue
    }

    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        self.registerCells()
    }
    
}

extension NewsFeedView: UITableViewDelegate, UITableViewDataSource {
    
    func registerCells() {
        self.tableView.register(NewsFeedCell.self, forCellReuseIdentifier: NewsFeedCell.getIdentifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getUIModelsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: NewsFeedCell = tableView.dequeueReusableCell(withIdentifier: NewsFeedCell.getIdentifier(),
                                                                  for: indexPath) as? NewsFeedCell,
        let uiModelForIndex = self.viewModel.getUIModel(atIndex: indexPath.row){
            cell.selectionStyle = .none
            cell.setupView()
            cell.setupData(fromModel: uiModelForIndex)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnItem(atIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension NewsFeedView: NewsFeedVMDelegate, Alertable {
    func sucessWhileFetchingData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func show(error msg: String) {
        showAlert(message: msg)
    }
    
    func moveToDetails(withURLString urlStr: String) {
        coordinator?.showNewsDetails(with: urlStr)
    }
}
