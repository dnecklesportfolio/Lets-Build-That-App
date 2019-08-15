//
//  ViewController.swift
//  UICollectionViewWithCode
//
//  Created by Dwayne Neckles on 8/10/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    let customCellIdentifier = "customCellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.backgroundColor = .red
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: customCellIdentifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionView?.dequeueReusableCell(withReuseIdentifier: customCellIdentifier, for: <#T##IndexPath#>)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

}

