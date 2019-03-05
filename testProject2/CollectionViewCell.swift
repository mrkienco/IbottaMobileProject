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
    
    var offerImage : UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    var offerCurrentValue : UILabel = {
        var label = UILabel()
        //label.textColor = UIColor.yellow
        return label
    }()
    
    var offerName : UILabel = {
        var name = UILabel()
        return name
    }()
   
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
