//
//  PropertyDetail.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 13/06/2022.
//

import Foundation

struct PropertyDetail: Codable {
    
    let type: String
    let id: String
    let askingPrice: Decimal
    let municipality: String
    let area: String
    let daysSincePublish: Int
    let livingArea: Double
    let numberOfRooms: Int
    let streetAddress: String
    let imageLink: String
    let description: String
    let patio: String
 
    enum CodingKeys: String, CodingKey {
        case type,
             id,
             askingPrice,
             municipality,
             area,
             daysSincePublish,
             livingArea,
             numberOfRooms,
             streetAddress,
             description,
             patio
        case imageLink = "image"
    }
}
