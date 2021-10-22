//
//  LoginViewModel.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import Foundation

class LoginViewModel {
    
    private var loginViewBlock: BooleanBlock?
    
    private let authenticationManager: AuthenticationManagerProtocol
    private let formatter: LoginViewDataProtocol
    
    init (formatter: LoginViewDataProtocol, authenticationManager: AuthenticationManager) {
        self.formatter = formatter
        self.authenticationManager = authenticationManager
    }
    
    func listenLoginAction(with completion: @escaping BooleanBlock) {
        loginViewBlock = completion
    }
    
    // MARK: - Private Methods
    private func fireSignIn() {
        authenticationManager.signIn(with: SimpleAuthenticationRequest(email: "takasi@gmail.com", password: "123456"))
        loginViewBlock?(true)
    }
    
    private func fireSignOut() {
        authenticationManager.logout()
    }
    
    private lazy var loginActionButtonListener: VoidBlock = { [weak self] in
        print("button tapped")
        self?.fireSignIn()
    }
    
    private lazy var signOutActionButtonListener: VoidBlock = { [weak self] in
        self?.fireSignOut()
    }
}
