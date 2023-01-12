//
//  MainViewController.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/12/23.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureTabBar()
    }
    
    // MARK: - Methods
    
    func configure() {
        let summaryViewController = SummaryViewController()
        let moneyViewController = MoneyViewController()
        let moreViewController = MoreViewController()
        
        summaryViewController.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyViewController.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Money")
        moreViewController.setTabBarImage(imageName: "ellipsis.circle", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryViewController)
        let moneyNC = UINavigationController(rootViewController: moneyViewController)
        let moreNC = UINavigationController(rootViewController: moreViewController)
        
        summaryNC.navigationBar.barTintColor = .systemTeal
        hideNavBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList


    }
    
    func configureTabBar() {
        tabBar.tintColor = .systemTeal
        tabBar.isTranslucent = false
    }
    
    func hideNavBarLine(_ navbar: UINavigationBar) {
        let img = UIImage()
        navbar.shadowImage = img
        navbar.setBackgroundImage(img, for: .default)
        navbar.isTranslucent = false
    }
    
}

class SummaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

class MoneyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}

class MoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
