//
//  CollectionViewCell.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class CollectionViewCell: UICollectionViewCell {
    
    var offerImage = UIImageView()
    var offerCurrentValue = UILabel()
    var offerName = UILabel()
    var offerFavorited = UIImageView()
    
    let favoriteIcon = UIImage(named: "star_favorited")
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews() {
        let name = offerName
        self.addSubview(name)
        name.numberOfLines = 0
        name.adjustsFontSizeToFitWidth = true
        name.heightAnchor == 35
        name.bottomAnchor == self.bottomAnchor
        name.horizontalAnchors == self.horizontalAnchors
        
        let currentValue = offerCurrentValue
        self.addSubview(currentValue)
        currentValue.numberOfLines = 0
        currentValue.adjustsFontSizeToFitWidth = true
        currentValue.heightAnchor == 35
        currentValue.bottomAnchor == name.topAnchor
        currentValue.horizontalAnchors == self.horizontalAnchors
        
        let image = offerImage
        self.addSubview(image)
        image.topAnchor == self.topAnchor + 6
        image.bottomAnchor == currentValue.topAnchor
        image.horizontalAnchors == self.horizontalAnchors + 6
        image.backgroundColor = #colorLiteral(red: 0.8775058125, green: 0.8775058125, blue: 0.8775058125, alpha: 1)
        image.contentMode = .scaleAspectFit
        
        let favIcon = offerFavorited
        self.addSubview(favIcon)
        favIcon.heightAnchor == 35
        favIcon.widthAnchor == 35
        favIcon.topAnchor == image.topAnchor + 6
        favIcon.rightAnchor == image.rightAnchor - 6
        favIcon.contentMode = .scaleAspectFit
    }
    
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
