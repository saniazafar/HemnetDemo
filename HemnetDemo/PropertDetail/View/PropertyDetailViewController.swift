//
//  PropertyDetailViewController.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 10/06/2022.
//

import UIKit
import SDWebImage

protocol PropertyDetailViewProtocol: AnyObject {
    func showAlert(with message: String)
}

class PropertyDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var areaAndMunicipalityLabel: UILabel!
    @IBOutlet weak var askingPriceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var livingAreaLabel: UILabel!
    @IBOutlet weak var numberOfRoomsLabel: UILabel!
    @IBOutlet weak var daysSincePublishedLabel: UILabel!
    @IBOutlet weak var patioLabel: UILabel!
    
    private var viewModel: PropertyDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel = PropertyDetailViewModel()
        viewModel?.fetchDetail { [weak self] in
            self?.configureUI()
        }
    }
    
    private func configureUI() {
        DispatchQueue.main.async {
            guard let viewModel = self.viewModel else {
                return
            }
            self.streetLabel.text = viewModel.streetAddress
            self.areaAndMunicipalityLabel.text = viewModel.areaAndMunicipality
            self.askingPriceLabel.text = viewModel.askingPrice
            self.descriptionLabel.text = viewModel.description
            self.livingAreaLabel.text = viewModel.livingArea
            self.numberOfRoomsLabel.text = viewModel.numberOfRooms
            self.daysSincePublishedLabel.text = viewModel.daysSincePublish
            self.patioLabel.text = viewModel.patio
            if let imageUrl = URL(string: viewModel.imageLink) {
                self.imageView.sd_setImage(with: imageUrl)
            }
        }
    }
}

extension PropertyDetailViewController: PropertyDetailViewProtocol {
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Hemnet", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}
