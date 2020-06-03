//
//  FavoriteRecipeCollectionViewCell.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 03/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class FavoriteRecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favRecipeImageView: UIImageView!
    @IBOutlet weak var favRecipeNameLabel: UILabel!
    @IBOutlet weak var favRecipeFavoriteButton: UIButton!
    var delegate: FavoriteRecipeListPresenterType?
    var recipeId: Int?

    func config(with model: Recipe) {
        favRecipeImageView.loadImage(from: model.imageURL)
        favRecipeNameLabel.text = model.title
        favRecipeFavoriteButton.setImage(UIImage(named: "ic-favoriteOn"), for: .normal)
        self.recipeId = model.id
    }
    
    @IBAction func favRecipeButtonTouch(_ sender: Any) {
        if let id = recipeId {
            delegate?.favoriteRecipe(with: id)
            delegate?.fetchData()
        }
    }
}
