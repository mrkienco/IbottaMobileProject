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
    
    var offerImage = UIImageView()
    var offerCurrentValue = UILabel()
    var offerName = UILabel()
    var offerDescription = UILabel()
    var offerTerms = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Offer Detail"
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
        image.topAnchor == self.view.safeAreaLayoutGuide.topAnchor + 10
        image.contentMode = .scaleAspectFit
        image.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        let isFavorite = FavoritesManager().isFavorite(id: offer.id!)
        let icon = FavoritesManager().setFavorite(isFav: isFavorite)
        favButton.setImage(icon, for: .normal)
        
        self.view.addSubview(favButton)
        favButton.heightAnchor == 50
        favButton.widthAnchor == 50
        favButton.topAnchor == image.topAnchor + 10
        favButton.rightAnchor == image.rightAnchor - 10
        favButton.contentMode = .scaleAspectFit
        favButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        var isFavorite = FavoritesManager().isFavorite(id: offer.id!)
        isFavorite.toggle()//sets bool value to true/false
        defaults.set(isFavorite, forKey: offer.id!)
        let icon = FavoritesManager().setFavorite(isFav: isFavorite)
        favButton.setImage(icon, for: .normal)
    }
}
