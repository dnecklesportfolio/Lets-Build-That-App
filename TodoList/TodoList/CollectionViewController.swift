//
//  ViewController.swift
//  TodoList
//
//  Created by Dwayne Neckles on 8/14/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        navigationItem.title = "To-do List"
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        
        //This is how you instantiate new classes
        collectionView?.register(Header.self, forCellWithReuseIdentifier: "headerid")
        collectionView?.register(TaskCell.self, forCellWithReuseIdentifier: "cell")
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    //Set Task
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let taskCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TaskCell
        taskCell.nameLabel.text = "Sample Task \(indexPath.item)"
        
        return taskCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //line below updated for Swift 4 Syntax
        return CGSize(width:view.frame.width, height: 50)
        
    }
    
    //Set Header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: "Headerid" , for: indexPath) as! Header
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height:100)
    }
    
}


class Header: UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // this is a closure
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
        
    }()
    
    func setupViews() {
        addSubview(nameLabel)
        //H: horizontal padding V: Vertical Padding
        // options: NSLayoutFormatOptions() -> NSLayoutConstraint.FormatOptions()
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
    
}




class TaskCell: UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // this is a closure
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Sample Task"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label}()
    
    func setupViews() {
        addSubview(nameLabel)
        //H: horizontal padding V: Vertical Padding
        // options: NSLayoutFormatOptions() -> NSLayoutConstraint.FormatOptions()
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    }
    
}

