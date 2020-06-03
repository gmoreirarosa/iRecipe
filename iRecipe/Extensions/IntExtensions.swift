//
//  IntExtensions.swift
//  iRecipe
//
//  Created by Tais Jaques da Silva on 04/07/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

extension Int {
    static func maxValue(firstValue: Int, secondValue: Int) -> Int {
        return firstValue > secondValue ? firstValue : secondValue
    }
}
