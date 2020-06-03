//
//  Result.swift
//  iRecipe
//
//  Created by Guilherme Moreira on 25/06/19.
//  Copyright © 2019 Guilherme Moreira. All rights reserved.
//

import Foundation

#if swift(>=5.0)
#else
enum Result<Success, Failure> where Failure : Error {
    
    /// A success, storing a `Success` value.
    case success(Success)
    
    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
#endif
