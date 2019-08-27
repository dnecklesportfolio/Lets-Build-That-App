//
//  AppsController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/21/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
class AppsPageController:BaseListController, UICollectionViewDelegateFlowLayout
    {
    
    let cellId = "id"
    let headerId = "headerid"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        // once you create custom class replace UICollView with class
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        ///header
         collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    //spawn header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    //3 size of header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 340)
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
