//
//  PropertyDetailViewModel.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 10/06/2022.
//

import Foundation

protocol PropertyDetailViewModelProtocol {
    var askingPrice: String { get }
    var areaAndMunicipality: String { get }
    var daysSincePublish: String { get }
    var livingArea: String { get }
    var numberOfRooms: String { get }
    var streetAddress: String { get }
    var imageLink: String { get }
    var description: String { get }
    var patio: String { get }
    
    func fetchDetail(completion: @escaping () -> Void)
}

class PropertyDetailViewModel: PropertyDetailViewModelProtocol {
    
    var networkServiceProvider: NetworkService
    weak var view: PropertyDetailViewProtocol?
    internal var propertyDetail: PropertyDetail?
    
    var askingPrice: String {
        "\(propertyDetail?.askingPrice ?? 0) SEK"
    }
    
    var areaAndMunicipality: String {
        (propertyDetail?.area ?? "") + ", " + (propertyDetail?.municipality ?? "")
    }
    
    var daysSincePublish: String {
        "Days since publish: \(propertyDetail?.daysSincePublish ?? 0)"
    }
    
    var livingArea: String {
        "Living Area: \(propertyDetail?.livingArea ?? 0) m²"
    }
    
    var numberOfRooms: String {
        "Number of rooms: \(propertyDetail?.numberOfRooms ?? 0)"
    }
    
    var streetAddress: String {
        propertyDetail?.streetAddress ?? ""
    }
    
    var imageLink: String {
        propertyDetail?.imageLink ?? ""
    }
    
    var description: String {
        propertyDetail?.description ?? ""
    }
    
    var patio: String {
        "Patio: " + (propertyDetail?.patio ?? "")
    }
    
    init() {
        networkServiceProvider = NetworkService(session: URLSession.shared)
    }
    
    func fetchDetail(completion: @escaping () -> Void) {
        let urlString = "https://pastebin.com/raw/uj6vtukE"
        guard let url = URL(string: urlString) else { return }
        networkServiceProvider.getRequest(with: url) { [weak self] data, error in
            if let _ = error {
                self?.view?.showAlert(with: "Something went wrong, please try again!")
                return
            }
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                else {
                    return
                }
                self?.propertyDetail = CodableParser.parseResponse(json, type: PropertyDetail.self)
                completion()
            } catch {}
        }
    }
}
