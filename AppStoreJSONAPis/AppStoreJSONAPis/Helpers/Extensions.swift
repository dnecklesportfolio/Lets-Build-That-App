//
//  Extensions,swift.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/23/19.
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

extension UIImageView {
    
    convenience init(cornerRadius:CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.backgroundColor = .purple
    }
}
extension UIButton {
    convenience init(title:String) {
        self.init(type:.system)
        self.setTitle(title, for: .normal)
    }
}
