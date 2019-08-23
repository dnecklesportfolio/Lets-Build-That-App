//
//  AppsHorizontalController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/22/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    let cellId = "id"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .blue
        
        // once you create custom class replace UICollView with class
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .horizontal
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    let topBottomPadding:CGFloat = 12
    let lineSpacing:CGFloat = 10
    //height width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding + 2 * lineSpacing) / 3
        return .init(width: view.frame.width, height: height)
    }
    //line spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    //cell spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:topBottomPadding, left:16 ,bottom:topBottomPadding , right:16)
    }
    
}



