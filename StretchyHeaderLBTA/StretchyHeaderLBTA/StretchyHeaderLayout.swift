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
        
        layoutAttributes?.forEach( {(attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else { return }
                
               
                
                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 {
                    return
                }
                let height =  attributes.frame.height - contentOffsetY
                
                //header
                attributes.frame = CGRect ( x:0, y:contentOffsetY, width:attributes.frame.width , height:height)
            }
            
            
        })
        
        
        return layoutAttributes
    }
    //invalidates layout to recaculacate layout
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
