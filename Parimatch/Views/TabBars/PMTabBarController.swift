//
//  PMTabBarController.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class PMTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().barTintColor = Colors.mainYellow
        
        viewControllers = [configureSoccerVC(), configureBetsVC()]
    }
    
    func configureSoccerVC() -> UINavigationController {
        let soccerVC = SoccerViewController()
        soccerVC.tabBarItem = UITabBarItem(title: "Soccer", image: UIImage(named: "soccerLogo"), tag: 0)
        
        return UINavigationController(rootViewController: soccerVC)
    }
    
    func configureBetsVC() -> UINavigationController {
        let betsVC = BetsViewController()
        betsVC.tabBarItem = UITabBarItem(title: "My bets", image: UIImage(named: "bet"), tag: 1)
        
        return UINavigationController(rootViewController: betsVC)
    }
}
