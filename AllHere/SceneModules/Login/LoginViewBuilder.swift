//
//  LoginViewBuilder.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import UIKit

class LoginViewBuilder {
    
    class func build() -> UIViewController {
        let authenticationManager = AuthenticationManager.shared
        let formatter = LoginViewDataFormatter()
        let viewModel = LoginViewModel(formatter: formatter, authenticationManager: authenticationManager)
        return LoginViewController(viewModel: viewModel)
    }
    
}

