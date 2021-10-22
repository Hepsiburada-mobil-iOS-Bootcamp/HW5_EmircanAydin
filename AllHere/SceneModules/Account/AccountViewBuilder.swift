//
//  AccountViewBuilder.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import UIKit

class AccountViewBuilder {
    
    class func build() -> UIViewController {
        let authenticationManager = AuthenticationManager.shared
        let formatter = AccountViewDataFormatter()
        let viewModel = AccountViewModel(formatter: formatter, authenticationManager: authenticationManager)
        let viewController = AccountViewController(viewModel: viewModel)
        viewController.title = "Account"
        viewController.tabBarItem.image = SFSymbolsHelper.personOutlined.value
        viewController.tabBarItem.selectedImage = SFSymbolsHelper.personFilled.value
        return viewController
    }
}
