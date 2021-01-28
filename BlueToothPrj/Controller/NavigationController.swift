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
        let navAppearance = nav.navigationController?.navigationBar
        navAppearance?.barStyle = .black
        //navAppearance?.isTranslucent = true
        navAppearance?.barTintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        return nav
    }()
    
    lazy var weightVC: UINavigationController = {
        let nav = UINavigationController(rootViewController: WeightViewController())
        let navAppearance = nav.navigationController?.navigationBar
        navAppearance?.barStyle = .black
        navAppearance?.isTranslucent = true
        navAppearance?.barTintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        //https://developer.apple.com/documentation/foundation/nsattributedstring/key
        navAppearance?.titleTextAttributes = [.foregroundColor: UIColor.black]
        nav.title = "Weight"
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
