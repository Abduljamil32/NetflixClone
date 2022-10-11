//
//  ViewController.swift
//  NetflixClone
//
//  Created by Abduljamil SwiftCoder on 29/09/22.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .black
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        vc1.title = "Home"
        vc1.tabBarItem.image = UIImage(systemName: "house")
        
        vc2.title = "Coming Soon"
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        
        vc3.title = "Top Search"
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc4.title = "Downloads"
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }


}

