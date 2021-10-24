//
//  CharacterCardData.swift
//  RickAndMorty
//
//  Created by Emircan Aydın on 14.10.2021.
//

import Foundation
import BaseComponents

class CharacterCardData: GenericDataProtocol {
    
    var type: GenericRowType?
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var labelPackData: CharacterCardLabelPackData
    
    init(imageData: CustomImageViewComponentData, labelPackData: CharacterCardLabelPackData) {
        self.imageData = imageData
        self.labelPackData = labelPackData
    }
}
