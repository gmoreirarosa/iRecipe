//
//  UIImageView.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 25/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            let options = ImageLoadingOptions(placeholder: nil, transition: .fadeIn(duration: 0.3), failureImage: nil)
            
            Nuke.loadImage(with: url, options: options, into: self)
        }
    }
}
