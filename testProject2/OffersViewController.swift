//
//  ViewController.swift
//  testProject2
//
//  Created by Michael Kozub on 3/1/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import SDWebImage
import Anchorage

class OffersViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView : UICollectionView!
    //var collectionView = UICollectionView()
    
    let cellId = "Cell"
    
    let margin: CGFloat = 12
    let interMargin: CGFloat = 8
    let interItemSpacing: CGFloat = 8
    let cellsPerRow = 2
    
    var offers = [OfferDataModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Offers"
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = interItemSpacing
        layout.minimumLineSpacing = 24
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(collectionView)
        collectionView.edgeAnchors == self.view.edgeAnchors

        APIManager().readJSONFromFile(onCompletion: { (offers) in
            self.offers = offers
            self.collectionView.reloadData()
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return offers.count
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offerDetailVC = OfferDetailViewController()
        offerDetailVC.offer = offers[indexPath.item]
        self.navigationController?.pushViewController(offerDetailVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margins = margin * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + interItemSpacing * CGFloat(cellsPerRow - 1)//played around with this and still not 100% sure why -1 works
        let width = ((collectionView.bounds.size.width - margins) / CGFloat(cellsPerRow))
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OfferCollectionViewCell
        
        let offer = offers[indexPath.item]
        let imageUrl = URL(string: offer.url ?? "")
        let offerName = offer.name ?? ""
        let currentValue = offer.currentValue ?? ""
        
        let isFav = FavoritesManager().isFavorite(id: offer.id!)

        cell.offerImage.sd_setImage(with: imageUrl)
        cell.offerCurrentValue.text = currentValue
        cell.offerName.text = offerName
        cell.offerFavorited.image = isFav ? FavoritesManager().setFavorite(isFav: isFav) : nil
        
        return cell
    }
    
}

