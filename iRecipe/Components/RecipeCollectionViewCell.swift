//
//  RecipeCollectionViewCell.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 03/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var favoriteRecipeButton: UIButton!
    var delegate: RecipeListPresenterType?
    var recipeId: Int?
    
    func config(with model: Recipe) {
        
        recipeImageView.loadImage(from: model.imageURL)
        recipeNameLabel.text = model.title
        favoriteRecipeButton.setImage(UIImage(named: delegate?.isFavorite(with: model.id) ?? false ? "ic-favoriteOn" : "ic-favoriteOff"), for: .normal)
        self.recipeId = model.id
    }
    
    @IBAction func favoriteRecipeButtonTouch(_ sender: Any) {
        if let id = recipeId {
            favoriteRecipeButton.setImage(UIImage(named: delegate?.favoriteRecipe(with: id) ?? "ic-favoriteOff"), for: .normal)
        }
    }
    
}
