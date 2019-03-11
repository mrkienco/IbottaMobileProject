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
        return defaults.bool(forKey: id)
    }
    
    func setFavorite(isFav : Bool) -> UIImage {
        var image = UIImage()
        image = isFav ? favoriteIcon! : standardIcon!
        //defaults.set(isFavorite, forKey: offer.id!) refactor this and return void
        //dont return images here, do that in the VC
        return image
    }
    
//    func saveFavorite(with id : String) {
//        defaults.set()
//    }
    
//    func toggleFavorite(id : String) -> Bool {
//        let isFav = !isFavorite(id: id)
//        defaults.set(isFav, forKey: id)
//        return isFav
//    }
    
}
