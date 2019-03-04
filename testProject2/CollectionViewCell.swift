//
//  CollectionViewCell.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

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
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.center
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    func addViews() {
        addSubview(offerImage)
        addSubview(offerCurrentValue)
        addSubview(offerName)
        addSubview(stackView)
        
        offerImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        offerImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        offerImage.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        offerImage.widthAnchor.constraint(equalToConstant: 36).isActive = true
        offerImage.contentMode = .scaleAspectFill
        
        stackView.addArrangedSubview(offerImage)
        //stackView.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 4).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
