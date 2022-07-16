//
//  NewsFeedCell.swift
//  NyTimesArticles
//
//  Created by Muhammad Ahmed Baig on 16/07/2022.
//

import UIKit

class NewsFeedCell: UITableViewCell, IdentifiableCell {
    
    var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    var autherLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "---"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "----"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func addViews() {
        self.backgroundColor = .white
        self.contentView.addSubview(self.titleLbl)
        self.contentView.addSubview(self.imgView)
        self.contentView.addSubview(self.autherLbl)
        self.contentView.addSubview(self.dateLbl)
    }
}
