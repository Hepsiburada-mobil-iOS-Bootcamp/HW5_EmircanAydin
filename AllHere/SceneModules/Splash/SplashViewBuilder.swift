//
//  SplashViewBuilder.swift
//  AllHere
//
//  Created by Emircan Aydın on 20.10.2021.
//

import UIKit

class SplashViewBuilder {
    
    class func build(with completion: @escaping VoidBlock) -> UIViewController {
        let viewModel = SplashViewModel(completion: completion)
        return SplashViewController(viewModel: viewModel)
    }
    
}
