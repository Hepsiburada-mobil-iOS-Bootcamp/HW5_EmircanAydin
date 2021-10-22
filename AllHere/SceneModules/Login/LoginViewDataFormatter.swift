//
//  LoginViewDataFormatter.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import Foundation

class LoginViewDataFormatter: LoginViewDataProtocol {
    
    func getLoginViewData() -> LoginAuthenticationViewData {
        return LoginAuthenticationViewData(actionButtonData: ActionButtonData(text: "Login", buttonType: .filled(.sugarLevelColor)).setActionButtonListener(by: loginActionButtonListener),signOutButton: ActionButtonData(text: "Sign out", buttonType: .filled(.bright)).setActionButtonListener(by: signOutActionButtonListener), emailLoginViewData: EmailLoginViewData(email: TextFieldViewData(placeHolder: "Email"), password: TextFieldViewData(placeHolder: "Password")))
    }
}
