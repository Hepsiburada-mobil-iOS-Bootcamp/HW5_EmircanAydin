//
//  AccountViewDataProtocol.swift
//  AllHere
//
//  Created by Emircan Aydın on 22.10.2021.
//

import Foundation
import BaseComponents

protocol AccountViewDataProtocol {
    
    func getAccountViewComponentData(by loggedIn: Bool) -> [GenericDataProtocol]
    
    func getHeaderViewData(with completion: @escaping VoidCompletionBlock) -> HeaderViewData
    
}
