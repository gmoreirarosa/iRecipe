//
//  RecipeListContract.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 22/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

protocol RecipeListViewType: AnyObject {
    func reloadData()
}

protocol RecipeListPresenterType: UICollectionViewDataSource {
    var view: RecipeListViewType? { get set }
    
    func fetchData()
    
    func recipeAt(index: Int) -> Recipe
    
    func favoriteRecipe(with id: Int) -> String
    
    func isFavorite(with id: Int) -> Bool
    
}

protocol RecipeListInteractorInput {
    func fetchData()
}

protocol RecipeListInteractorOutput: AnyObject {
    func dataFetched(_ data: [Recipe])
}
