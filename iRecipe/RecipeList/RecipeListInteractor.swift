//
//  RecipeListInteractor.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 22/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

class RecipeListInteractor {
    
    private let requestMaker = RequestMaker()
    
    private weak var output: RecipeListInteractorOutput?
    
    init(output: RecipeListInteractorOutput) {
        self.output = output
    }
    
}

extension RecipeListInteractor: RecipeListInteractorInput {
    
    func fetchData() {
        requestMaker.make(withEndpoint: .list) { (recipeList: [Recipe]) in
            self.output?.dataFetched(recipeList)
        }
    }
    
}
