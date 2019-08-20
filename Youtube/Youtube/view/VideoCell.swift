//
//  VideoCell.swift
//  Youtube
//
//  Created by Dwayne Neckles on 8/17/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

//like how we put related classes at the end of the file
class BaseCell:UICollectionViewCell {
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class VideoCell: BaseCell {
    // how to dynamically set the spacingbased on number of lines
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    var video: Video? {
        
        didSet{
            titleLabel.text = video?.title
            thumbnailImageView.image = UIImage(named:(video?.thumbnailImageName)!)
            
            if let profileImageName = video?.channel?.profileImageName {
                
                userProfileImageView.image = UIImage(named:profileImageName)
                
                
            }
            //how to get commands
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            //how to unwrapp multiple options
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                let subtitleText = "\(channelName) •  \(numberFormatter.string(from: numberOfViews)!) Views • 3 months ago"
                
                subtitleTextView.text = subtitleText
            }
            // measure title text depeonding if size height
            
            if let title = video?.title {
                let size = CGSize(width: frame.width - 16 - 44  - 8 - 16, height: 1000 )
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedRect = NSString(string: title).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], context: nil)
                
                if Int(estimatedRect.size.height) > 20 {
                    titleLabelHeightConstraint?.constant = 44
                } else {
                    titleLabelHeightConstraint?.constant = 20
                }
                
            }
        } }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        //here is how you import an image and get the aspect ratio right
        imageView.image = UIImage(named:"rhapsody_video")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    let userProfileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .green
        view.image = UIImage(named:"rhapsody_logo")
        //make shape circular
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        return view
        
    }()
    
    let seperatorView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red:230/255, green:230/255, blue:230/255, alpha:1  )
        return view
        
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ibtihaj, featuring D'Angelo and GZA"
        label.numberOfLines = 2
        
        return label
        
    }()
    
    let subtitleTextView: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "RhapsodyVEVO • views • 1 month"
        label.textContainerInset = UIEdgeInsets(top: 0,left: -4,bottom: 0, right: 0)
        label.textColor = UIColor.lightGray
        
        
        return label
    }()
    
    
    
    
    override func setupViews() {
        
        
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        
        
        
        
        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat("H:|-16-[v0(44)]", views: userProfileImageView)
        
        
        addConstraintsWithFormat("V:|-16-[v0]-8-[v1(44)]-28-[v2(1)]|", views: thumbnailImageView, userProfileImageView, seperatorView)
        
        
        addConstraintsWithFormat("H:|[v0]|", views: seperatorView)
        
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right , multiplier: 1, constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right , multiplier: 1, constant: 0))

        
        
        titleLabelHeightConstraint = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(titleLabelHeightConstraint!)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 4))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        
    }
    
    
    
    
}
