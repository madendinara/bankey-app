//
//  AppDelegate.swift
//  bankey-app
//
//  Created by Динара Зиманова on 1/6/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var loginViewController = LoginViewController()
    var onboardingContainerViewController = OnboardingContainerViewController()
    var homeViewController = HomeViewController()
    var mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        homeViewController.delegate = self
        onboardingContainerViewController.delegate = self
        window?.rootViewController = SummaryViewController()
        
        
        return true
    }

}

extension AppDelegate {
    func setViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setViewController(homeViewController)
        } else {
            setViewController(onboardingContainerViewController)

        }
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        setViewController(homeViewController)
        LocalState.hasOnboarded = true
    }
    
}

extension AppDelegate: LogoutDelegate {
    func didSignOut() {
        setViewController(loginViewController)
    }
    
}

