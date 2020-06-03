//
//  RecipeDetailsInteractor.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 24/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeDetailsInteractor {
    
    private let requestMaker = RequestMaker()
    
    private weak var output: RecipeDetailsInteractorOutput?
    
    init(output: RecipeDetailsInteractorOutput) {
        self.output = output
    }
    
}

extension RecipeDetailsInteractor: RecipeDetailsInteractorInput {
    
    func fetchData() {
    }

}
