//
//  BaseListController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/22/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
class BaseCollectionViewController :UICollectionViewController {
    
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } 
}
