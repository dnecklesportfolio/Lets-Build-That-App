//
//  StretchyHeaderLayout.swift
//  StretchyHeaderLBTA
//
//  Created by Dwayne Neckles on 8/15/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {

    //modify the attributes of our header components
    override func layoutAttributesForElements ( in rect: CGRect) ->        [UICollectionViewLayoutAttributes]? {
            let layoutAttributes = super.layoutAttributesForElements(in: rect)
            return layoutAttributes
    }
}
