//
//  ViewController.swift
//  Youtube
//
//  Created by Dwayne Neckles on 8/16/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var videos:[Video] = {
        var kanyeChannel = Channel()
        kanyeChannel.name = "KanyeIstheBestChannel"
        kanyeChannel.profileImageName = "kanye_profile"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space Blank SpaceBlank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = kanyeChannel
        blankSpaceVideo.numberOfViews = 21345423
        
        return [blankSpaceVideo]
    }()
    
    fileprivate let padding: CGFloat = 16
    
    func fetchVideos() {
        guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    self.videos.append(video)
                }
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            
            }.resume()
    }
override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchVideos()
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
    
    return videos.count
}

//set a cell
override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // make it a video cell
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! VideoCell
    
    cell.video = videos[indexPath.item]
    return cell
}

// set height and with of the cells
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = (view.frame.width - 16 - 16) * 9/16
    return CGSize(width: view.frame.width ,height: height + 16 + 44 + 16 + 12)
}

//reduce extra spacing
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}

}
