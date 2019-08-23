//
//  AppsGroupCell.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/22/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text:String, font:UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

class AppsGroupCell: UICollectionViewCell {
    let titleLabel = UILabel(text:"App Section", font:.boldSystemFont(ofSize:30))
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        backgroundColor = .lightGray
        addSubview(titleLabel)
        //used to fill entire parent commenting it reduces size
        //titleLabel.fillSuperview()
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .blue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
