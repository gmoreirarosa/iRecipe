//
//  RecipeTabBar.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 22/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import UIKit

class RecipeTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.commonInit()
    }
    
    func commonInit() {
        self.tintColor = UIColor(named: "ItensColor")
    }
}
