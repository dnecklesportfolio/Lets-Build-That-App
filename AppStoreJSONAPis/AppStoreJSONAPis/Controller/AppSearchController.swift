//
//  AppSearchController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/19/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchController : UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate   {
    
    fileprivate let cellId = "id1234"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)

    fileprivate let enterSearchTermLabel:UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
       
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top:100,left:50,bottom:0, right: 50))
        
        setupSearchBar()
         //fetchItunesApps()
    }
    

    fileprivate func setupSearchBar(){
    definesPresentationContext = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    var timer:Timer?
    func searchBar(_ searchBar:UISearchBar,textDidChange searchText:String) {
        print(searchText)
        //introduce a delay
        timer?.invalidate()// invalidates the previous timer
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                self.appResults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
       
    }
    fileprivate var appResults = [Result]()
    //the function that reads the data
    fileprivate func fetchItunesApps() {
        //this calls service class todo its processing
        Service.shared.fetchApps(searchTerm: "Twitter") { (results, err) in
            //fails
            if let err = err {
                print("failed to fetch apps:", err)
                return
            }
            //success
            self.appResults = results
            //used to call on main thread
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            } 
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
            cell.appResult = appResults[indexPath.item]
  
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width:view.frame.width, height:350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




