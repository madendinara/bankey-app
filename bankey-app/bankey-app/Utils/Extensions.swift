//
//  Extensions.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/12/23.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusView = UIView(frame: frame)
        
        statusView.backgroundColor = .systemTeal
        view.addSubview(statusView)
        
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
