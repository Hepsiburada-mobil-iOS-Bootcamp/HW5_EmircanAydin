//
//  AccountViewController.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import UIKit
import BaseComponents

class AccountViewController: BaseViewController<AccountViewModel> {
    
    private var mainComponent: ItemListView!
    
    
    // MARK: - Private Methods
    private func appendMainComponent() {
        
        mainComponent = ItemListView(data: viewModel.getItemListViewData())
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
    
    private func subscribeViewModelPublishers() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .loading:
                break
            case .done:
                self?.mainComponent.reloadTableView()
            default:
                break
            }
        }
        
        viewModel.subscribeLoginAction { [weak self] in
            self?.userLoginStateHandler()
        }
    }
    
    private func userLoginStateHandler() {
        
    }
    
}
