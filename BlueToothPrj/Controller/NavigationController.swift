//
//  NavigationController.swift
//  BlueToothPrj
//
//  Created by EricM on 1/20/21.
//

import Foundation
import UIKit

class NavigationVC: UITabBarController {
    
    lazy var calendarVC: UINavigationController = {
       let nav = UINavigationController(rootViewController: CalendarVC())
        return nav
    }()
    
    lazy var weightVC: UINavigationController = {
        let nav = UINavigationController(rootViewController: WeightViewController())
        return nav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "calendar"), tag: 0)
        weightVC.tabBarItem = UITabBarItem(title: "Weight", image: UIImage(systemName: "folder"), tag: 1)
        self.viewControllers = [calendarVC, weightVC]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
