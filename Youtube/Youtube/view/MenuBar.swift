//
//  MenuBar.swift
//  Youtube
//
//  Created by Dwayne Neckles on 8/17/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit



class MenuBar :UIView,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red:230, green: 32, blue:31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let imageNames = ["home", "trending", "subscriptions", "account"]
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        
        //select home button initall
        let selectedIndexPath = NSIndexPath(item:0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: true, scrollPosition: [])
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
    
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width/4, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

//MenuBar - MenuCell
class MenuCell: BaseCell {
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return iv
    }()
    override var isHighlighted: Bool {
        didSet {
            
            imageView.tintColor = isHighlighted ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
       
        }
    }
    override var isSelected: Bool {
        didSet {
            
            imageView.tintColor = isSelected ? .white : UIColor.rgb(red: 91, green: 14, blue: 13)
           
        }
    }
    
    override func setupViews() {
        
        super.setupViews()
        addSubview(imageView)
        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)])
        addConstraints([NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)])
  
    }
}

