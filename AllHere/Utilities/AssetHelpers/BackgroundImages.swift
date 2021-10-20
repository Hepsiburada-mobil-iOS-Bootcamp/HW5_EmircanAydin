//
//  BackgroundImages.swift
//  AllHere
//
//  Created by Emircan Aydın on 20.10.2021.
//

import BaseComponents
import UIKit

enum BackgroundImages: String, GenericValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case launchBacgkround = "launch_bg"
}
