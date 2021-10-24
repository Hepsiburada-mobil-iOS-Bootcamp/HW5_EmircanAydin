//
//  MainViewModel.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 16.10.2021.
//

import Foundation
import RxSwift
import BaseComponents

class MainViewModel {
    
 
    private let disposeBag = DisposeBag()
    private let authenticationManager: AuthenticationManagerProtocol
    private var formatter: MainViewDataFormatterProtocol
    private let operationManager: CharacterListOperationsProtocol
    
    private var state: MainViewStateBlock?
    private var loginActionBlock: VoidBlock?
    
    private var data: CharacterResponseModel?
    
    init(authenticationManager: AuthenticationManagerProtocol, formatter: MainViewDataFormatterProtocol, operationManager: CharacterListOperationsProtocol) {
        self.authenticationManager = authenticationManager
        self.formatter = formatter
        self.operationManager = operationManager
        subscribeOperationManagerPublisher()
        subscribeAuthenticationManager()
    }
    
    func getCharacterList(with pagination: Bool = false) {
        state?(.loading)
        operationManager.getCharacterListData(page: formatter.paginationInfo.page)
    }
    
    func subscribeViewState(with completion: @escaping MainViewStateBlock) {
        state = completion
    }
    
    func subscribeLoginAction(with completion: @escaping VoidBlock) {
        loginActionBlock = completion
    }

    // MARK: - PrivateMethods
    private func subscribeAuthenticationManager() {
        authenticationManager.isLoggedIn(with: isLoggedInListener)
        state?(.loading)
        authenticationManager.subscribeLoginState { [weak self] userState in
            self?.getCharacterList(with: true)
            self?.state?(.done)
        }.disposed(by: disposeBag)
    }
    
    private func subscribeOperationManagerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("\(error)")
            case .success(let response):
                self?.formatter.setData(with: response)
                self?.dataHandler(with: response)
            }
        }
    }
    
    private func dataHandler(with response: CharacterResponseModel?) {
        formatter.paginationInfo.fetching = false
        data = response
        state?(.done)
    }
    
    private func loggedInListenerHandler(with value: Bool) {
        state?(.loading)
        
        if value {
            getCharacterList(with: true)
        } else {
            print("lamamdsamdas")
        }
        
        state?(.done)
    }
    
    // MARK: - Listener Handlers
    private lazy var loginActionButtonListener: VoidBlock = { [weak self] in
        self?.loginActionBlock?()
    }
    
    private lazy var isLoggedInListener: BooleanBlock = { [weak self] value in
        self?.loggedInListenerHandler(with: value)
    }
    
}

extension MainViewModel: CharacterCollectionComponentDelegate {
    
    func getNumberOfSection() -> Int {
        return formatter.getNumberOfSection()
    }
    
    func getItemCount(in section: Int) -> Int {
        return formatter.getNumbeOfItem(in: section)
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return formatter.getItem(from: formatter.getData(at: index))
    }
    
    func getMoreData() {
        guard formatter.paginationInfo.checkLoadingMore() else { return }
        formatter.paginationInfo.nextOffset()
        getCharacterList(with: true)
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= formatter.getCount()
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return formatter.getNumbeOfItem(in: section)
    }
}
