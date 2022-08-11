//
//  UIImageView+LoadImage.swift
//  Pokedex
//
//  Created by Vitor Aspirot on 09/08/22.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        Nuke.loadImage(with: url,
                       options: ImageLoadingOptions(placeholder: Images.red_pokeball()),
                       into: self)
        
    }
    
}
