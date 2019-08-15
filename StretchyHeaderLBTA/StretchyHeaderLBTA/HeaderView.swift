//
//  HeaderView.swift
//  StretchyHeaderLBTA
//
//  Created by Dwayne Neckles on 8/15/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header") )
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init ( frame:CGRect) {
        super.init( frame: frame)
        
        backgroundColor = .red
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
