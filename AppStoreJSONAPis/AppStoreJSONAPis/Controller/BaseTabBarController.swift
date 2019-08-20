//
//  BaseTabBarController.swift
//  AppStoreJSONAPis
//
//  Created by Dwayne Neckles on 8/19/19.
//  Copyright © 2019 Dwayne Neckles. All rights reserved.
//

import UIKit

class BaseTabBarController:UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewControllers = [
        
            createNavController(viewController: AppsSearchController(), title: "Search", imageName: "search"),
            createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", imageName: "apps")] }
}


fileprivate func createNavController(viewController:UIViewController, title: String, imageName:String) -> UIViewController {
    
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true;
    navController.tabBarItem.image = UIImage(named:imageName)
    viewController.view.backgroundColor = .white
    viewController.navigationItem.title = title
    navController.tabBarItem.title =  title
    return navController
}
