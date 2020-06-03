//
//  FavoriteRecipeListContract.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 03/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

protocol FavoriteRecipeListViewType: AnyObject {
    func reloadData()
}

protocol FavoriteRecipeListPresenterType: UICollectionViewDataSource {
    var view: FavoriteRecipeListViewType? { get set }
    
    func fetchData()
    
    func recipeAt(index: Int) -> Recipe
    
    func favoriteRecipe(with id: Int) -> String
    
    func isFavorite(with id: Int) -> Bool
}

protocol FavoriteRecipeListInteractorInput {
    func fetchData()
}

protocol FavoriteRecipeListInteractorOutput: AnyObject {
    func dataFetched(_ data: [Recipe])
}
