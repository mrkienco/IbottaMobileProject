//
//  CollectionViewCell.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class OfferCollectionViewCell: UICollectionViewCell {
    
    var offerImage = UIImageView()
    var offerCurrentValue = UILabel()
    var offerName = UILabel()
    var offerFavorited = UIImageView()
    
    let favoriteIcon = UIImage(named: "star_favorited")
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureViews()
    }
    
    func addViews() {
        let name = offerName
        self.addSubview(name)
        name.bottomAnchor == self.bottomAnchor
        name.horizontalAnchors == self.horizontalAnchors
        
        let currentValue = offerCurrentValue
        self.addSubview(currentValue)
        currentValue.bottomAnchor == name.topAnchor
        currentValue.horizontalAnchors == self.horizontalAnchors
        
        let imageBackground = UIView()
        self.addSubview(imageBackground)
        imageBackground.topAnchor == self.topAnchor
        imageBackground.bottomAnchor == currentValue.topAnchor - 8
        imageBackground.horizontalAnchors == self.horizontalAnchors
        imageBackground.backgroundColor = #colorLiteral(red: 0.8775058125, green: 0.8775058125, blue: 0.8775058125, alpha: 1)
        imageBackground.layer.cornerRadius = 5.0
        
        let image = offerImage
        self.addSubview(image)
        image.verticalAnchors == imageBackground.verticalAnchors + 6
        image.horizontalAnchors == imageBackground.horizontalAnchors + 6
        image.contentMode = .scaleAspectFit
        
        let favIcon = offerFavorited
        self.addSubview(favIcon)
        favIcon.heightAnchor == 35
        favIcon.widthAnchor == 35
        favIcon.topAnchor == image.topAnchor + 3
        favIcon.rightAnchor == image.rightAnchor - 3
        favIcon.contentMode = .scaleAspectFit
    }
    
    func configureViews() {
        let name = offerName
        name.setNameLabel()
        name.numberOfLines = 1
        
        let currentValue = offerCurrentValue
        currentValue.setCurrentValueLabel()
        currentValue.numberOfLines = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UILabel {
    func setNameLabel() {
        self.font = UIFont(name: "AvenirNext-Regular", size: 11)
        self.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
    }
    
    func setCurrentValueLabel() {
        self.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
        self.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
    }
}
