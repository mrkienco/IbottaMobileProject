//
//  OffersAPI.swift
//  testProject2
//
//  Created by Michael Kozub on 3/11/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import Foundation

class APIManager {
    
    //how to do this in the background thread
    func readJSONFromFile(fileName: String) -> Array<OfferDataModel> {
        var offers = [OfferDataModel]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let offersDecoded = try decoder.decode(Array<OfferDataModel>.self, from: data)
                
                offers = offersDecoded
                
                
            } catch {
                print(error)
            }
        }
        return offers
    }
    
}
