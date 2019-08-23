//
//  SearchResultCell.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/19/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult:Result! {
        
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            
            let url = URL(string: appResult.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string:appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count>1 {
                screenshot2ImageView.sd_setImage(with: URL(string:appResult.screenshotUrls[1]))
                
            }
            if appResult.screenshotUrls.count>2 {
                screenshot3ImageView.sd_setImage(with: URL(string:appResult.screenshotUrls[2]))
                
            }
        }
    }
    let appIconImageView:UIImageView = {
        let iv = UIImageView()
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
   // let ssArr = [screenshot1ImageView,screenshot2ImageView,screenshot3ImageView]
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshots(index:Int) -> UIImageView {
       // ssArr[index]
        let view = UIImageView()
        return view
    }
    
    func createScreenshotImageView() -> UIImageView {
        let view = UIImageView()
        return view
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        
        //Stacks within Stacks
        //labels vertical
 
        //info horizontal
        let infoTopstackView = UIStackView(arrangedSubviews: [appIconImageView,            VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel,ratingsLabel]),getButton])
        infoTopstackView.spacing = 12
        infoTopstackView.alignment = .center
        
        //ss horizontal
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView,screenshot2ImageView,screenshot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopstackView, screenshotStackView], spacing: 16)
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top:16, left: 16, bottom:16, right:16))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
