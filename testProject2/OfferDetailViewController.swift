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
    
    let defaults = UserDefaults.standard
    
    var favButton = UIButton(type: .custom)
    let standardIcon = UIImage(named: "star_standard")
    let favoriteIcon = UIImage(named: "star_favorited")
    
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
        terms.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        terms.bottomAnchor == self.view.bottomAnchor - 10
        
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
//        let standardSpacing: CGFloat = 100.0
//        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: standardSpacing)
//        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.contentMode = .scaleAspectFit
     
        if FavoritesController().isFavorite(id: offer.id!) {
            setFavIcon(isFav: true)
        } else {
            setFavIcon(isFav: false)
        }
        
        self.view.addSubview(favButton)
        favButton.topAnchor == image.bottomAnchor
        favButton.bottomAnchor == name.topAnchor
        favButton.horizontalAnchors == self.view.horizontalAnchors
        favButton.contentMode = .scaleAspectFit
        favButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        var boolValue = FavoritesController().isFavorite(id: offer.id!)
        
        if boolValue == false {            boolValue = true
        } else {
            boolValue = false
        }
        defaults.set(boolValue, forKey: offer.id!)
        setFavIcon(isFav: boolValue)
        
//        print("Now the value is: \(boolValue)")
    }
        
    func setFavIcon(isFav : Bool) {
        if isFav {
            favButton.setImage(favoriteIcon, for: .normal)
        } else {
            favButton.setImage(standardIcon, for: .normal)
        }
    }
}
