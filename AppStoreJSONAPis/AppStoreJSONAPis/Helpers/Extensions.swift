//
//  Extensions,swift.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/23/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import Foundation
extension UILabel {
    convenience init(text:String, font:UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
