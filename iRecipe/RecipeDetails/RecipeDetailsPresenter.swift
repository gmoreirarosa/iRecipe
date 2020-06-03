//
//  RecipeDetailsPresenter.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 24/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeDetailsPresenter: NSObject {
    weak var view: RecipeDetailsViewType?
    
    private lazy var interactor: RecipeDetailsInteractorInput = RecipeDetailsInteractor(output: self)
    
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

extension RecipeDetailsPresenter: RecipeDetailsPresenterType {
    
    func fetchData() {
        self.interactor.fetchData()
    }
    
    func favoriteRecipe(with id: Int) -> String {
        if self.favoritesIds.contains(id) {
            self.favoritesIds.remove(id)
            return "ic-favoriteOff"
        } else {
            self.favoritesIds.insert(id)
            return "ic-favoriteOn"
        }
    }
    
    func isFavorite(with id: Int) -> Bool {
        return self.favoritesIds.contains(id)
    }
    
}

extension RecipeDetailsPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe", for: indexPath)
        
        if let recipeCell = cell as? RecipeCollectionViewCell {
            
        }
        
        return cell
    }
    
}


extension RecipeDetailsPresenter: RecipeDetailsInteractorOutput {
    
    func dataFetched() {
        
    }
    
}
