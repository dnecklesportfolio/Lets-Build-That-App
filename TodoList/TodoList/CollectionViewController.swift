//
//  ViewController.swift
//  TodoList
//
//  Created by Dwayne Neckles on 8/14/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        navigationItem.title = "To-do List"
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        
        
        
        
    }
    
   
    
    
}


