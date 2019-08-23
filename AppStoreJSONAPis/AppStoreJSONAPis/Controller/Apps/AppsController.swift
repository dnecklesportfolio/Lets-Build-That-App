//
//  AppsController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/21/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
class AppsController:BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        
        // once you create custom class replace UICollView with class
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }

//      Functions below were moved to BaseListController.swift to reduce repeated code
//    init() {
//        super.init(collectionViewLayout: UICollectionViewFlowLayout())
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
