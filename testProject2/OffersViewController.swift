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
    
    var collectionView: UICollectionView!
    let cellId = "Cell"
    
//    let bottomMargin: CGFloat = 24
//    let interMargin: CGFloat = 8
//    let cellsPerRow = 2
    
    let margin: CGFloat = 12
    let interMargin: CGFloat = 8
    let interItemSpacing: CGFloat = 8
    let cellsPerRow = 2
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Offers"
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = interMargin
//        layout.minimumLineSpacing = bottomMargin
        
        layout.minimumInteritemSpacing = interItemSpacing
        layout.minimumLineSpacing = 24
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = true
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(collectionView)

        readJSONFromFile(fileName: "Offers")
    }

    var offers = [OfferDataModel]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return offers.count
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let offerDetailVC = OfferDetailViewController()
        offerDetailVC.offer = offers[indexPath.item]
        self.navigationController?.pushViewController(offerDetailVC, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        //let width = (collectionView.bounds.size.width / CGFloat(cellsPerRow)) - (interMargin / 2)
//        let width = (collectionView.bounds.size.width / CGFloat(cellsPerRow)) - (15) // possibly cellMargin / 2
//        print("Width of device: \(collectionView.bounds.size.width)")
//        print("Formula returns: \(width)")
//        return CGSize(width: width, height: width)
//    }
    
    //try not to use this
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margins = margin * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + interItemSpacing * CGFloat(cellsPerRow - 1)//played around with this and still not 100% sure why -1 works
        let width = ((collectionView.bounds.size.width - margins) / CGFloat(cellsPerRow))
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        let imageUrl = URL(string: offers[indexPath.item].url ?? "")
        let offerName = offers[indexPath.item].name ?? ""
        let currentValue = offers[indexPath.item].currentValue ?? ""
        let isFav = FavoritesController().isFavorite(id: offers[indexPath.item].id!)
        print(isFav)
        cell.offerImage.sd_setImage(with: imageUrl)
        cell.offerCurrentValue.text = currentValue
        cell.offerName.text = offerName
//        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        if isFav {
            cell.offerFavorited.image = UIImage(named: "star_favorited")
        } else {
            cell.offerFavorited.image = nil
        }
        
        return cell
    }
    
    func readJSONFromFile(fileName: String) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl)
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    for item in json! {
                        let offer = OfferDataModel(
                            id: item["id"] as? String,
                            url: item["url"] as? String,
                            currentValue: item["current_value"] as? String,
                            name: item["name"] as? String,
                            description: item["description"] as? String,
                            terms: item["terms"] as? String
                        )
                        offers.append(offer)
                    }
                }
                
            } catch {
                
            }
        }
    }
}

