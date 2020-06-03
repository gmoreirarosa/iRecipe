//
//  RecipeListPresenter.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 22/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeListPresenter: NSObject {
    weak var view: RecipeListViewType?
    
    private lazy var interactor: RecipeListInteractorInput = RecipeListInteractor(output: self)

    private var recipeList = [Recipe]()
    
    private let idsKey = "favorites.ids"
    
    override init() {
        if let data = UserDefaults.standard.array(forKey: idsKey) as? [Int] {
            self.favoritesIds = Set(data)
        } else {
            self.favoritesIds = []
        }
        
        super.init()
    }
    
    private var favoritesIds: Set<Int> {
        didSet {
            UserDefaults.standard.set(Array(favoritesIds), forKey: idsKey)
        }
    }
}

extension RecipeListPresenter: RecipeListPresenterType {
    
    func fetchData() {
        self.interactor.fetchData()
    }
    
    func recipeAt(index: Int) -> Recipe {
        return self.recipeList[index]
    }
    
    func favoriteRecipe(with id: Int) -> String {
        if let data = UserDefaults.standard.array(forKey: idsKey) as? [Int] {
            self.favoritesIds = Set(data)
        } else {
            self.favoritesIds = []
        }
        
        if self.favoritesIds.contains(id) {
            self.favoritesIds.remove(id)
            return "ic-favoriteOff"
        } else {
            self.favoritesIds.insert(id)
            return "ic-favoriteOn"
        }
    }
    
    func isFavorite(with id: Int) -> Bool {
        if let data = UserDefaults.standard.array(forKey: idsKey) as? [Int] {
            self.favoritesIds = Set(data)
        } else {
            self.favoritesIds = []
        }
        
        return self.favoritesIds.contains(id)
    }
    
}

extension RecipeListPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listRecipeCell", for: indexPath)
        
        if let recipeCell = cell as? RecipeCollectionViewCell {
            recipeCell.delegate = self
            recipeCell.config(with: self.recipeList[indexPath.row])
        }
        
        return cell
    }
}

extension RecipeListPresenter: RecipeListInteractorOutput {
    
    func dataFetched(_ data: [Recipe]) {
        self.recipeList = data
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
    
}
