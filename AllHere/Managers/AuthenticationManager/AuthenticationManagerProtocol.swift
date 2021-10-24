//
//  AuthenticationManagerProtocol.swift
//  AllHere
//
//  Created by Emircan Aydın on 21.10.2021.
//

import Foundation
import Firebase
import RxSwift

typealias BooleanBlock = (Bool) -> Void

protocol AuthenticationManagerProtocol {
    
    func isLoggedIn(with completion: @escaping BooleanBlock)
    
    func signIn(with request: AuthenticationRequest)
    
    func logout()
    
    func subscribeLoginState(with completion: @escaping BooleanBlock ) -> Disposable
    
}
