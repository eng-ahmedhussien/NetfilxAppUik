//
//  ViewController.swift
//  NetfilxAppUik
//
//  Created by ahmed hussien on 08/02/2024.
//

import UIKit

class MainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: UpComingVC())
        let vc3 = UINavigationController(rootViewController: SearchVC())
        let vc4 = UINavigationController(rootViewController: DownloadVC())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.square")
        
        vc1.title = "Home"
        vc2.title = "Upcomming"
        vc3.title = "Search"
        vc4.title = "Download"
        
        tabBar.tintColor = .label
        
        ///Sets the root view controllers of the tab bar controller.
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }


}

