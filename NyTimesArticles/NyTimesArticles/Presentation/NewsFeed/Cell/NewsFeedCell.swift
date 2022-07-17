//
//  NewsFeedCell.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import UIKit

class NewsFeedCell: UITableViewCell, IdentifiableCell, Shadowable {
    
    var backView: UIView = {
        let bView = UIView()
        bView.translatesAutoresizingMaskIntoConstraints = false
        bView.backgroundColor = .white
        return bView
    }()
    
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 3
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        lbl.textColor = .black
        return lbl
    }()
    
    var autherLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textColor = .black
        return lbl
    }()
    
    var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "----"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textColor = .black
        return lbl
    }()
    
    override func layoutSubviews() {
//        self.makeShadowAndCornerRadius(toView: self.backView)
        self.imgView.layer.cornerRadius = 8.0
    }
    
    func setupView() {
        // Initialization code
        self.addViews()
        self.setupConstriants()
    }
    
    private func addViews() {
        self.backgroundColor = .white
        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.titleLbl)
        self.backView.addSubview(self.imgView)
        self.backView.addSubview(self.autherLbl)
        self.backView.addSubview(self.dateLbl)
    }
    
    private func setupConstriants() {
        self.setupConstraintsForBackView()
        self.setupConstraintsForImageView()
        self.setupConstraintsForTitleLbl()
        self.setupConstraintsForAutherLbl()
        self.setupConstraintsForDataLbl()
    }
    
    private func setupConstraintsForBackView() {
        let guideLine = self.contentView.safeAreaLayoutGuide
        
        self.backView.topAnchor.constraint(equalTo: guideLine.topAnchor, constant: 12).isActive = true
        self.backView.leftAnchor.constraint(equalTo: guideLine.leftAnchor, constant: 12).isActive = true
        self.backView.bottomAnchor.constraint(equalTo: guideLine.bottomAnchor, constant: -12).isActive = true
        self.backView.rightAnchor.constraint(equalTo: guideLine.rightAnchor, constant: -12).isActive = true
    }
    
    private func setupConstraintsForImageView() {
        self.imgView.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 10).isActive = true
        self.imgView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -10).isActive = true
        self.imgView.leftAnchor.constraint(equalTo: self.backView.leftAnchor, constant: 10).isActive = true
        
        self.imgView.widthAnchor.constraint(equalTo: self.imgView.heightAnchor).isActive = true
    }
    
    private func setupConstraintsForTitleLbl() {
        self.titleLbl.topAnchor.constraint(equalTo: imgView.topAnchor).isActive = true
        self.titleLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 10).isActive = true
        self.titleLbl.rightAnchor.constraint(equalTo: self.backView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupConstraintsForAutherLbl() {
        self.autherLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 10).isActive = true
        self.autherLbl.leftAnchor.constraint(equalTo: titleLbl.leftAnchor).isActive = true
        self.autherLbl.bottomAnchor.constraint(equalTo: imgView.bottomAnchor).isActive = true
        
        self.autherLbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    private func setupConstraintsForDataLbl() {
        self.dateLbl.topAnchor.constraint(equalTo: autherLbl.topAnchor).isActive = true
        self.dateLbl.leftAnchor.constraint(equalTo: autherLbl.rightAnchor, constant: 10).isActive = true
        self.dateLbl.bottomAnchor.constraint(equalTo: autherLbl.bottomAnchor).isActive = true
        self.dateLbl.rightAnchor.constraint(equalTo: self.titleLbl.rightAnchor).isActive = true
        self.dateLbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    func setupData(fromModel uiModel: NewsUIModel) {
        self.imgView.setImage(from: uiModel.imageURL)
        self.autherLbl.text = uiModel.auther
        self.dateLbl.text = uiModel.date
        self.titleLbl.text = uiModel.title
    }
}