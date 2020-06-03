//
//  IllustrationTableViewCell.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 01/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class IllustrationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureRecipeImageView: UIImageView!
    
    func config(imageUrl: String) {
        pictureRecipeImageView.loadImage(from: imageUrl)
    }
}
