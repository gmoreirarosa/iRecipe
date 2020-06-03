//
//  RecipeDetailsContract.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 24/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

protocol RecipeDetailsViewType: AnyObject {
    func reloadData()
}

protocol RecipeDetailsPresenterType: UITableViewDataSource {
    var view: RecipeDetailsViewType? { get set }
    
    func fetchData()
    
    func favoriteRecipe(with id: Int) -> String
    
    func isFavorite(with id: Int) -> Bool
}

protocol RecipeDetailsInteractorInput {
    func fetchData()
}

protocol RecipeDetailsInteractorOutput: AnyObject {
    func dataFetched()
}

