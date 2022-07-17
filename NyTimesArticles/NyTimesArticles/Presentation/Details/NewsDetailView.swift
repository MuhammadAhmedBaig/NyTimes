//
//  NewsDetailView.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 18/07/2022.
//

import UIKit
import WebKit

class NewsDetailView: UIViewController {

    var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var viewModel: NewsDetailViewModel
    
    init(viewModel: NewsDetailViewModel) {
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
        self.setupConstraintsForWebView()
        
        self.viewModel.resolveAndShowDetails()
    }
    
    func addViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.webView)
    }
    
    func setupConstraintsForWebView() {
        let guideLine = self.view.safeAreaLayoutGuide
        
        self.webView.topAnchor.constraint(equalTo: guideLine.topAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor).isActive = true
        self.webView.leftAnchor.constraint(equalTo: guideLine.leftAnchor).isActive = true
        self.webView.rightAnchor.constraint(equalTo: guideLine.rightAnchor).isActive = true
    }
}

extension NewsDetailView: NewsDetailViewModelDelegate, Alertable {
    func load(URLRequest request: URLRequest) {
        self.webView.load(request)
    }
    
    func show(Error msg: String) {
        self.showAlert(message: msg)
    }
}
