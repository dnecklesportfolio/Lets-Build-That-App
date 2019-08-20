//
//  VerticalStackView.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/20/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangedSubviews:[UIView], spacing: CGFloat = 0 ) {
        super.init(frame:.zero)
        self.spacing = spacing
        self.axis = .vertical
        //need to study
        arrangedSubviews.forEach({addArrangedSubview($0)})
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
