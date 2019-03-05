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

struct Offer {
    let url: String?
    let currentValue : String?
    let name: String?
}

class OfferViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    let cellId = "Cell"
    
    let margin: CGFloat = 12
    let interMargin: CGFloat = 8
    let interItemSpacing: CGFloat = 8
    let cellsPerRow = 2
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
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

    var offers = [Offer]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print(offers.count)
         return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin) //didn't know what to do with top/bottom so I used margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let marginsAndInsets = margin * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + interItemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth + 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionViewCell
        let imageUrl = URL(string: offers[indexPath.item].url ?? "")
        let offerName = offers[indexPath.item].name ?? ""
        let currentValue = offers[indexPath.item].currentValue ?? ""
//        print(indexPath)
//        print(imageUrl as Any)
//        print(offerName)
//        print(currentValue)
        cell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        cell.offerImage.sd_setImage(with: imageUrl)
        cell.offerCurrentValue.text = currentValue
        cell.offerName.text = offerName
        
        return cell
    }
    
    func readJSONFromFile(fileName: String) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl)
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    for item in json! {
                        let offer = Offer(
                            url: item["url"] as? String,
                            currentValue: item["current_value"] as? String,
                            name: item["name"] as? String
                        )
                        offers.append(offer)
                    }
                }
                
            } catch {
                
            }
        }
    }

}

