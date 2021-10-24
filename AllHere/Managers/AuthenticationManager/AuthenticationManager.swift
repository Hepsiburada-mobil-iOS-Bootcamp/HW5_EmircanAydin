//
//  AuthenticationManager.swift
//  AllHere
//
//  Created by Emircan Aydın on 21.10.2021.
//

import Foundation
import FirebaseAuth
import RxSwift

class AuthenticationManager: AuthenticationManagerProtocol {
    
    public static let shared = AuthenticationManager()
    
    private var toko: BooleanBlock?
    
    private let authSubject = PublishSubject<Bool>()
    
    private init() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.authSubject.onNext(true)
            } else {
                self.authSubject.onNext(false)
            }
        }
    }
    
    func subscribeLoginState(with completion: @escaping BooleanBlock ) -> Disposable {
        return authSubject.subscribe(onNext: completion)
    }
    
    func isLoggedIn(with completion: @escaping BooleanBlock) {
        Auth.auth().addStateDidChangeListener { auth, user in
            print("isLoggedIn \((user != nil) ? true : false)")
            completion((user != nil) ? true : false)
            self.toko?((user != nil) ? true : false)
        }
    }
    
    func toko(with completion: @escaping BooleanBlock) {
        toko = completion
    }
    
    func signIn(with request: AuthenticationRequest) {
        Auth.auth().signIn(withEmail: request.email, password: request.password) { authDataResult, error in
            if error != nil {
                print("Error : \(error)")
            }
            print("data : \(authDataResult)")
            print("break")
        }
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("error : \(error)")
        }
    }
    
}
