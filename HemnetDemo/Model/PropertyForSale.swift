//
//  PageModel.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 03/06/2022.
//

import Foundation

public enum PropertyType: String, Codable {
    case highlightedProperty = "HighlightedProperty"
    case property = "Property"
    case area = "Area"
}

struct PropertyForSale: Codable {
    let type: PropertyType
    let id: String
    let askingPrice: Decimal?
    let monthlyFee: Decimal?
    let municipality: String?
    let area: String
    let daysSincePublish: Int?
    let livingArea: Double?
    let numberOfRooms: Int?
    let streetAddress: String?
    let imageLink: String
    let ratingFormatted: String?
    let averagePrice: Decimal?

    enum CodingKeys: String, CodingKey {
        case type,
             id,
             askingPrice,
             monthlyFee,
             municipality,
             area,
             daysSincePublish,
             livingArea,
             numberOfRooms,
             streetAddress,
             ratingFormatted,
             averagePrice
        case imageLink = "image"
    }
}
