//
//  FavoritesController.swift
//  testProject2
//
//  Created by Michael Kozub on 3/7/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import Foundation

class FavoritesController {
    
    let defaults = UserDefaults.standard
    
    func isFavorite(id : String) -> Bool {
        let boolValue : Bool = defaults.bool(forKey: id)//returns false if it doesn't exist in userDefaults
        return boolValue
    }
    
}
