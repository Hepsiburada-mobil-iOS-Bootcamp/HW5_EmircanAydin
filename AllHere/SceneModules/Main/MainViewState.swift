//
//  MainViewState.swift
//  AllHere
//
//  Created by Emircan Aydın on 24.10.2021.
//

import Foundation

typealias MainViewStateBlock = (MainViewState) -> Void

enum MainViewState {
    
    case loading
    case done
    case failure
    
}
