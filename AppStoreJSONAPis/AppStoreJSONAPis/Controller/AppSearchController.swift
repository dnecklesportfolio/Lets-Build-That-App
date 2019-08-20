//
//  AppSearchController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/19/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class AppsSearchController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "id1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        fetchItunesApps()
    }

    
    //the function that reads the data
    fileprivate func fetchItunesApps() {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return }
        //fetch data from internet
        URLSession.shared.dataTask(with: url) {(data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps: ", err)
                return
            }
            
            //success
            guard let data = data else {return }
            
            do {
                let searchResult = try
                 JSONDecoder().decode(SearchResult.self, from:data)
                print(searchResult.results.forEach({print($0.trackName,$0.primaryGenreName)}))
            }catch {
                print("Failed to decode json: ", error)
            }
            //pass in what you want to decode it as , for example it would be struct
           
            }.resume() //fires off the request
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.nameLabel.text = "Here is my app name"
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width:view.frame.width, height:350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




