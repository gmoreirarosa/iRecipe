//
//  InformationTableViewCell.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 01/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleRecipeLabel: UILabel!
    @IBOutlet weak var timeRecipeLabel: UILabel!
    @IBOutlet weak var levelRecipeLabel: UILabel!
    @IBOutlet weak var descriptionRecipeLabel: UILabel!
    
    func config(recipe: Recipe?) {
        titleRecipeLabel.text = recipe?.title
        timeRecipeLabel.text = recipe?.time
        levelRecipeLabel.text = recipe?.level
        descriptionRecipeLabel.text = recipe?.description
    }
}
