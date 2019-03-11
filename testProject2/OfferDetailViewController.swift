//
//  ViewController.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class OfferDetailViewController: UIViewController {//unsure how to name this class
    
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
        configureViews()
    }
    
    func addViews() {
        let terms = offerTerms
        self.view.addSubview(terms)
        terms.horizontalAnchors == self.view.horizontalAnchors
        terms.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let description = offerDescription
        self.view.addSubview(description)
        description.horizontalAnchors == self.view.horizontalAnchors
        description.bottomAnchor == terms.topAnchor
        
        let currentValue = offerCurrentValue
        self.view.addSubview(currentValue)
        currentValue.horizontalAnchors == self.view.horizontalAnchors
        currentValue.bottomAnchor == description.topAnchor
        //        currentValue.rightAnchor == favButton.leftAnchor
        //        currentValue.centerYAnchor == favButton.centerYAnchor
        //        currentValue.leftAnchor == self.view.leftAnchor
        
        let name = offerName
        self.view.addSubview(name)
        name.horizontalAnchors == self.view.horizontalAnchors
        name.bottomAnchor == currentValue.topAnchor
        
        let image = offerImage
        self.view.addSubview(image)
        image.topAnchor == self.view.safeAreaLayoutGuide.topAnchor + 10
        image.heightAnchor == self.view.heightAnchor / 2
        image.horizontalAnchors == self.view.safeAreaLayoutGuide.horizontalAnchors + 10
        
        let isFavorite = FavoritesManager().isFavorite(id: offer.id!)
        let icon = FavoritesManager().setFavorite(isFav: isFavorite)
        favButton.setImage(icon, for: .normal)
        
        self.view.addSubview(favButton)
        favButton.heightAnchor == 50
        favButton.widthAnchor == 50
        favButton.topAnchor == image.bottomAnchor + 10
        favButton.rightAnchor == image.rightAnchor - 20
        favButton.contentMode = .scaleAspectFit
        favButton.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        
    }
    
    func configureViews() {
        let terms = offerTerms
        terms.text = offer.terms
        terms.numberOfLines = 0
        
        let description = offerDescription
        description.text = offer.description
        description.numberOfLines = 0
        
        let currentValue = offerCurrentValue
        currentValue.text = offer.currentValue
        currentValue.numberOfLines = 0
        currentValue.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        currentValue.adjustsFontSizeToFitWidth = true
        currentValue.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        let name = offerName
        name.text = offer.name
        name.numberOfLines = 1
        name.font = UIFont(name: "AvenirNext-Regular", size: 20)
        name.adjustsFontSizeToFitWidth = true
        name.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        
        let image = offerImage
        let imageUrl = URL(string: offer.url ?? "")
        image.sd_setImage(with: imageUrl)
        image.contentMode = .scaleAspectFit
        image.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    }
    
    @objc func buttonTapped(sender: UIButton) {
        var isFavorite = FavoritesManager().isFavorite(id: offer.id!)
        isFavorite.toggle()//sets bool value to true/false
        //refactor setFavorite
        defaults.set(isFavorite, forKey: offer.id!)
        let icon = FavoritesManager().setFavorite(isFav: isFavorite)
        favButton.setImage(icon, for: .normal)
    }
}

//extension UILabel {
////    func setNameLabel() {
////        self.font = UIFont(name: "AvenirNext-Regular", size: 11)
////        self.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
////    }
////
////    func setCurrentValueLabel() {
////        self.font = UIFont(name: "AvenirNext-DemiBold", size: 12)
////        self.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
////    }
//}
