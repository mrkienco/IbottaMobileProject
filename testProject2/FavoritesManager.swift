//
//  FavoritesController.swift
//  testProject2
//
//  Created by Michael Kozub on 3/7/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

class FavoritesManager {
    
    let defaults = UserDefaults.standard
    let standardIcon = UIImage(named: "star_standard")
    let favoriteIcon = UIImage(named: "star_favorited")
    
    func isFavorite(id : String) -> Bool {
        let boolValue : Bool = defaults.bool(forKey: id)//returns false if it doesn't exist in userDefaults
        return boolValue
    }
    
    func setFavorite(isFav : Bool) -> UIImage {
        var image = UIImage()
        if isFav {
            image = favoriteIcon!
        } else {
            image = standardIcon!
        }
        return image
    }
    
}
