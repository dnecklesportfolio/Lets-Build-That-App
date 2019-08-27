//
//  AppRowCell.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/23/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//
import UIKit


class AppRowCell: UICollectionViewCell {
 
    
    let imageView:UIImageView = UIImageView(cornerRadius:8)
    
    let nameLabel:UILabel = UILabel(text:"App Name", font: .systemFont(ofSize:20))
    
    let companyLabel =  UILabel(text:"App Name", font: .systemFont(ofSize:13))
    
    let getButton = UIButton(title: "GET")
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        backgroundColor = .white
    
        //image
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize:16)
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.layer.cornerRadius = 32 / 2
        
        //combinehorizontal
        let stackView = UIStackView( arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews:[nameLabel, companyLabel],spacing:4), getButton])
        addSubview(stackView)
        stackView.fillSuperview()
        stackView.alignment = .center
        stackView.spacing =   16
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
