//
//  OfferDataModel.swift
//  testProject2
//
//  Created by Michael Kozub on 3/5/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

struct OfferDataModel : Codable {
    let id: String?
    let url: String?
    let currentValue : String?
    let name: String?
    let description: String?
    let terms: String?
    
    enum CodingKeys : String, CodingKey {
        case id
        case url
        case name
        case description
        case terms
        case currentValue = "current_value"
    }
}
