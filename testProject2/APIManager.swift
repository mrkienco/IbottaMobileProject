//
//  OffersAPI.swift
//  testProject2
//
//  Created by Michael Kozub on 3/11/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import Foundation

class APIManager {
    
    func readJSONFromFile(onCompletion: @escaping (_ offers: [OfferDataModel]) -> Void ){
        DispatchQueue.global().async {
            let fileName = "Offers"
            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                do {
                    let fileUrl = URL(fileURLWithPath: path)
                    let data = try Data(contentsOf: fileUrl)
                    let decoder = JSONDecoder()
                    let offersDecoded = try decoder.decode(Array<OfferDataModel>.self, from: data)
                    DispatchQueue.main.async {
                        onCompletion(offersDecoded)
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
    }
    
}
