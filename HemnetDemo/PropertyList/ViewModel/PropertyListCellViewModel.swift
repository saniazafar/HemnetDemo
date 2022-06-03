//
//  PropertyListCellViewModel.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 15/06/2022.
//

import Foundation

protocol PropertyListCellViewModelProtocol: AnyObject {
    var imageLink: String { get }
    var type: PropertyType { get }
    var streetAddress: String { get }
    var area: String { get }
    var areaAndMunicipality: String { get }
    var askingPrice: String { get }
    var livingArea: String { get }
    var numberOfRooms: String { get }
    var ratingFormatted: String { get }
    var averagePrice: String { get }
}

class PropertyListCellViewModel: PropertyListCellViewModelProtocol {
    
    private let property: PropertyForSale
    
    var imageLink: String {
        property.imageLink
    }
    
    var type: PropertyType {
        property.type
    }
    
    var streetAddress: String {
        property.streetAddress ?? ""
    }
    
    var area: String {
        property.area
    }
    
    var areaAndMunicipality: String {
        property.area + ", " + (property.municipality ?? "")
    }
    
    var askingPrice: String {
        "\(property.askingPrice ?? 0) SEK"
    }
    
    var livingArea: String {
        "\(property.livingArea ?? 0) m²"
    }
    
    var numberOfRooms: String {
        "\(property.numberOfRooms ?? 0) rooms"
    }
    
    var ratingFormatted: String {
        "Rating: " + (property.ratingFormatted ?? "")
    }
    
    var averagePrice: String {
        "Average price: \(property.averagePrice ?? 0) SEK"
    }
    
    init(property: PropertyForSale) {
        self.property = property
    }
}
