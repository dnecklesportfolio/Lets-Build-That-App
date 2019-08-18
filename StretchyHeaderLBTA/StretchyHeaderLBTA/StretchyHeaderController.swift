//
//  StretchyHeaderController.swift
//  StretchyHeaderLBTA
//
//  Created by Dwayne Neckles on 8/15/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit


class StretchyHeaderController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellID = "cellID"
    fileprivate let headerID = "headerID"
    fileprivate let padding: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionView()
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        //the top edge photo header meets margin
        collectionView.contentInsetAdjustmentBehavior = .never
        
        
        //instantiate cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        //instantiate header
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
    
    fileprivate func setupLayout() {
        // MARK: - LAYOUT CUSTOMIZATION
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 15
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        //print(abs(contentOffsetY/100))
        
        if contentOffsetY > 0 {
            return
        }
        headerView?.animator.fractionComplete = abs(contentOffsetY/100)
    }
    
    
    // MARK: - Setup Header
    var headerView: HeaderView?
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as? HeaderView
        return headerView!
    }
    
    //set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width , height:340)
    }
    
    
    // MARK: - Setup Cells
    // set number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    //set a cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor =   .black
        return cell
    }
    
    // set height and with of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * padding,height: 50)
    }
}
