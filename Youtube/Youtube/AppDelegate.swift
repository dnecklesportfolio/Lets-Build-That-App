//
//  AppDelegate.swift
//  Youtube
//
//  Created by Dwayne Neckles on 8/16/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController:HomeController(collectionViewLayout: UICollectionViewFlowLayout() ))
        
        //get rid of black bar underneath nav bar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .default)
        UINavigationBar.appearance().barTintColor = UIColor.rgb(red:230, green: 32, blue:31)
        
        let statusBarBgView = UIView()
        statusBarBgView.backgroundColor = UIColor.rgb(red:194, green:31, blue: 31)
        window?.addSubview(statusBarBgView)
        window?.addConstraintsWithFormat("H:|[v0]|", views: statusBarBgView)
        window?.addConstraintsWithFormat("V:|[v0(38)]", views: statusBarBgView)
         return true
    }
  
    
    
}
