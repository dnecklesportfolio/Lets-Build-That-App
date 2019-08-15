//
//  HeaderView.swift
//  StretchyHeaderLBTA
//
//  Created by Dwayne Neckles on 8/15/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
    let iv = UIImageView(image: #imageLiteral(resourceName: "stretchy_header") )
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init ( frame:CGRect) {
        super.init( frame: frame)
        
        backgroundColor = .red
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        //blur
        setupVisualEffectBlur()
        setupGradientLayer()
    }
    fileprivate func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5,1]
        
        let gradientContainerView = UIView()
        addSubview(gradientContainerView)
        gradientContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradientContainerView.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = self.bounds
        
        gradientLayer.frame.origin.y -= bounds.height
        
        let heavyLabel = UILabel()
        heavyLabel.text = "Dwayne Makes Apps Now!"
        heavyLabel.font = .systemFont(ofSize:24,weight:.heavy)
        heavyLabel.textColor = .white
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Go onto the website and buy more stuff otherwise a sad puppy dies if you dont"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        
        let stackView = UIStackView( arrangedSubviews: [heavyLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading:leadingAnchor,bottom:bottomAnchor, trailing:trailingAnchor, padding:.init(top: 0, left:16, bottom:16, right: 16))
        
        
        
        
        
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
            [ weak self] in
             //end state of animation
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect:blurEffect)
        self?.addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        })
        
        animator.fractionComplete = 0
        
         

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
