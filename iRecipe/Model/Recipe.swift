//
//  Recipe.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 25/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    
    let id: Int
    let title: String
    let imageURL: String
    let likes: Int?
    let liked: Bool?
//    let detailURL: String
    let ingredients: [String]?
    let steps: [String]?
    let author: String?
    let time: String?
    let level: String?
    let description: String?
    
}
