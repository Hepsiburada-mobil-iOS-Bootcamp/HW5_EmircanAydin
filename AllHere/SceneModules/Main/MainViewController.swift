//
//  MainViewController.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 16.10.2021.
//

import UIKit
import BaseComponents

class MainViewController: BaseViewController<MainViewModel> {
    
    private var mainComponent: CharacterCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .white
        addMainComponent()
        addViewModelListeners()    }
    
    private func addMainComponent() {
        mainComponent = CharacterCollectionView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
        
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        
        ])
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.mainComponent.reloadCollectionView()
            default:
                break
            }
        }
    }
    
}
