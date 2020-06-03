//
//  FavoriteRecipeInteractor.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 03/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

class FavoriteRecipeListInteractor {
    
    private let requestMaker = RequestMaker()
    
    private weak var output: FavoriteRecipeListInteractorOutput?
    
    init(output: FavoriteRecipeListInteractorOutput) {
        self.output = output
    }   
}

extension FavoriteRecipeListInteractor: FavoriteRecipeListInteractorInput {
    
    func fetchData() {
        requestMaker.make(withEndpoint: .favorites) { (recipeList: [Recipe]) in
            self.output?.dataFetched(recipeList)
        }
    }
}
