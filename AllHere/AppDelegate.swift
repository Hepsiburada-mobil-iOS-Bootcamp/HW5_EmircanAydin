//
//  AppDelegate.swift
//  AllHere
//
//  Created by Emircan Aydın on 20.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow()
        let mainView = SplashViewBuilder.build {
            self.initializeMainView()
        }
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func initializeMainView() {
        DispatchQueue.main.async {
            UIView.transition(with: self.window!, duration: 0.3, options: .transitionCrossDissolve) {
                self.fireMainView()
            }
        }
    }
    
    private func fireMainView() {
        
    }

}

