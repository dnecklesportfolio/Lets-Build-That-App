//
//  SearchResultCell.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/19/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        //customize width inside here
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel:UILabel =
    {
        let label = UILabel()
        label.text = "APP NAME"
        
        return label
    }()
    
    let categoryLabel:UILabel =
    {
        let label = UILabel()
        label.text = "Photos & Video"
        
        return label
    }()
    
    let ratingsLabel:UILabel =
    {
        let label = UILabel()
        label.text = "9.26M"
        
        return label
    }()
    
    let getButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize:14)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true; //sets width
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true; //sets height
        return button
    }()
    
    // need lazy keyword so it can access functions
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    func createScreenshotImageView() -> UIImageView {
        let view = UIImageView()
        view.backgroundColor = .blue
        return view
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
         
        
        //Stacks within Stacks
        //labels vertical
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel,ratingsLabel])
        labelsStackView.axis = .vertical
        
        //info horizontal
        let infoTopstackView = UIStackView(arrangedSubviews: [appIconImageView,labelsStackView,getButton])
        infoTopstackView.spacing = 12
        infoTopstackView.alignment = .center
        
        //ss horizontal
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView,screenshot2ImageView,screenshot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = UIStackView(arrangedSubviews: [infoTopstackView, screenshotStackView])
             addSubview(overallStackView)
        overallStackView.axis = .vertical
        overallStackView.spacing = 16
        overallStackView.fillSuperview(padding: .init(top:16, left: 16, bottom:16, right:16))
   
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
