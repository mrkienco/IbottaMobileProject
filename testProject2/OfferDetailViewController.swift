//
//  ViewController.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class OfferDetailViewController: UIViewController {
    
    var offer = OfferDataModel(id: nil, url: nil, currentValue: nil, name: nil, description: nil, terms: nil)
    
    var viewController: UIViewController!
    
    var offerImage : UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    var offerCurrentValue : UILabel = {
        var label = UILabel()
        return label
    }()
    
    var offerName : UILabel = {
        var label = UILabel()
        return label
    }()
    
    var offerDescription : UILabel = {
        var label = UILabel()
        return label
    }()
    
    var offerTerms : UILabel = {
        var label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Offer Detail"
        print(offer)
        addViews()
    }
    
    func addViews() {
        
        let terms = offerTerms
        self.view.addSubview(terms)
        terms.text = offer.terms
        terms.numberOfLines = 0
        terms.adjustsFontSizeToFitWidth = true
        terms.heightAnchor == 35
        terms.horizontalAnchors == self.view.horizontalAnchors
        terms.bottomAnchor == self.view.bottomAnchor - 10
        
        let description = offerDescription
        self.view.addSubview(description)
        description.text = offer.description
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        description.heightAnchor == 35
        description.horizontalAnchors == self.view.horizontalAnchors
        description.bottomAnchor == terms.topAnchor
        
        let currentValue = offerCurrentValue
        self.view.addSubview(currentValue)
        currentValue.text = offer.currentValue
        currentValue.numberOfLines = 0
        currentValue.adjustsFontSizeToFitWidth = true
        currentValue.heightAnchor == 35
        currentValue.horizontalAnchors == self.view.horizontalAnchors
        currentValue.bottomAnchor == description.topAnchor
        
        let name = offerName
        self.view.addSubview(name)
        name.text = offer.name
        name.numberOfLines = 0
        name.adjustsFontSizeToFitWidth = true
        name.heightAnchor == 35
        name.horizontalAnchors == self.view.horizontalAnchors
        name.bottomAnchor == currentValue.topAnchor
        
        let imageUrl = URL(string: offer.url ?? "")
        let image = offerImage
        image.sd_setImage(with: imageUrl)
        self.view.addSubview(image)
        image.horizontalAnchors == self.view.horizontalAnchors
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        image.contentMode = .scaleAspectFit
//        image.bottomAnchor == name.topAnchor

    }
    
}
