//
//  PropertyListViewModel.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 04/06/2022.
//

import Foundation

class PropertyListViewModel {
    
    var networkServiceProvider: NetworkService
    weak var view: PropertyListViewProtocol?
    
    var propertiesForSale: [PropertyForSale] = []
    
    init() {
        networkServiceProvider = NetworkService(session: URLSession.shared)
    }
    
    func fetchPropertiesForSale(completion: @escaping () -> Void) {
        let urlString = "https://pastebin.com/raw/nH5NinBi"
        guard let url = URL(string: urlString) else { return }
        networkServiceProvider.getRequest(with: url) { [weak self] data, error in
            if let _ = error {
                self?.view?.showAlert(with: "Something went wrong, please try again!")
                return
            }
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any],
                      let items = json["items"]
                else {
                    return
                }
                
                self?.propertiesForSale = CodableParser.parseResponse(items, type: [PropertyForSale].self) ?? []
                completion()
            } catch {}
        }
    }
}
