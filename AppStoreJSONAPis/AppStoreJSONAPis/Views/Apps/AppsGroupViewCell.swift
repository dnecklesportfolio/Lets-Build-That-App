//
//  AppsGroupCell.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/22/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit


class AppsGroupCell: UICollectionViewCell {
    let titleLabel = UILabel(text:"App Section", font:.boldSystemFont(ofSize:30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = .white
        addSubview(titleLabel)
        //used to fill entire parent commenting it reduces size
        //titleLabel.fillSuperview()
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init( top:0, left:16, bottom:0, right:0))
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .white
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
