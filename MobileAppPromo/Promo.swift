//
//  Promo.swift
//  MobileAppPromo
//
//  Created by Evita Sihombing on 28/03/24.
//

import Foundation

struct Promo: Codable {
    let id: Int
    let name: String
    let imageURL: URL
    let detailURL: String

    private enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "images_url"
        case detailURL = "detail"
    }
}
