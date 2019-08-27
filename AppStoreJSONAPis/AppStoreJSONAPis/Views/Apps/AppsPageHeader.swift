//
//  AppsPageHeader.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/23/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
class AppsPageHeader: UICollectionReusableView  {
   
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init( frame:CGRect) {
        super.init(frame:frame)
        backgroundColor = .white
        
        
        appHeaderHorizontalController.view.backgroundColor = .purple
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
