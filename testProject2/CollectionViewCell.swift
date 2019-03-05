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
        
        let image = offerImage
        self.addSubview(image)
        image.horizontalAnchors == self.horizontalAnchors + 6
        image.verticalAnchors == self.verticalAnchors + 6
        image.contentMode = .scaleAspectFit
//        offerCurrentValue.numberOfLines = 0
//        offerCurrentValue.adjustsFontSizeToFitWidth = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
