//
//  MainViewBuilder.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 16.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {
        
        let manager = CharacterListOperationsManager.shared
        let formatter = MainViewDataFormatter()
        let viewModel = MainViewModel(authenticationManager: AuthenticationManager.shared, formatter: formatter, operationManager: manager)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        viewController.title = "Characters"
        viewController.tabBarItem.image = TabBarImages.home.value
        viewController.tabBarItem.selectedImage = TabBarImages.homeSelected.value
        viewController.navigationController?.setNavigationBarHidden(false, animated: false)
        viewController.navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = RickAndMortyColor.blue.value
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationViewController
    }
    
}
