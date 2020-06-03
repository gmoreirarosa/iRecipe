//
//  FavoriteRecipeListPresenter.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 03/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class FavoriteRecipeListPresenter: NSObject {
    weak var view: FavoriteRecipeListViewType?
    
    private lazy var interactor: FavoriteRecipeListInteractorInput = FavoriteRecipeListInteractor(output: self)
    
    private var favRecipeList = [Recipe]()
    
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

extension FavoriteRecipeListPresenter: FavoriteRecipeListPresenterType {
    
    func fetchData() {
        self.interactor.fetchData()
    }
    
    func recipeAt(index: Int) -> Recipe {
        return self.favRecipeList[index]
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

extension FavoriteRecipeListPresenter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favRecipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteRecipeCell", for: indexPath)
        
        if let favRecipeCell = cell as? FavoriteRecipeCollectionViewCell {
            favRecipeCell.delegate = self
            favRecipeCell.config(with: self.favRecipeList[indexPath.row])
        }
        
        return cell
    }
}

extension FavoriteRecipeListPresenter: FavoriteRecipeListInteractorOutput {
    
    func dataFetched(_ data: [Recipe]) {
        self.favRecipeList = data
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
    
}
