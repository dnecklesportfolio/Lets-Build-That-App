//
//  ViewController.swift
//  Youtube
//
//  Created by Dwayne Neckles on 8/16/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    fileprivate let padding: CGFloat = 16
    override func viewDidLoad() {
        super.viewDidLoad() 
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame:CGRect(x: 0,y: 0,width: view.frame.width - 32, height: view.frame.height))
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        navigationItem.titleView = titleLabel
       collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView?.backgroundColor = UIColor.white
        
       //contentinset
        collectionView?.contentInset = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
       // study later scrollIndicatorInsets
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        setupMenuBar()
        setupNavBarButtons()
    
    }
    
    private func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
 
        let searchBarButtonItem =         UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named:"nav_more_icon")?.withRenderingMode(.alwaysOriginal), style:.plain, target:self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    @objc func handleMore() {
        print("dewde")
    }
    @objc func handleSearch() {
        print("dewde")
    }
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
       view.addSubview(menuBar)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    // set number of cells
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //set a cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        
        return cell
    }
    
    // set height and with of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width ,height: height + 16 + 44 + 16)
    }
    
    //reduce extra spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
