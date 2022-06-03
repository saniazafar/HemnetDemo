//
//  PropertyListCollectionViewCell.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 04/06/2022.
//

import UIKit
import SDWebImage

class PropertyListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var areaAndMunicipalityLabel: UILabel!
    @IBOutlet weak var askingPriceLabel: UILabel!
    @IBOutlet weak var livingAreaLabel: UILabel!
    @IBOutlet weak var numberOfRoomsLabel: UILabel!
    
    static var cellIdentifier: String {
        "PropertyListCollectionViewCell"
    }
    
    override func prepareForReuse() {
        imageView.removeBorder()
        imageView.image = nil
    }

    func configureUI(with viewModel: PropertyListCellViewModelProtocol) {
        if let imageUrl = URL(string: viewModel.imageLink) {
            imageView.sd_setImage(with: imageUrl)
        }
        if viewModel.type == .highlightedProperty {
            imageView.applyBorder(width: 5.0, color: UIColor.yellow.cgColor)
        }
        streetLabel.text = viewModel.streetAddress
        areaAndMunicipalityLabel.text = viewModel.areaAndMunicipality
        askingPriceLabel.text = viewModel.askingPrice
        livingAreaLabel.text = viewModel.livingArea
        numberOfRoomsLabel.text = viewModel.numberOfRooms
    }
}

extension UIImageView {
    
    func applyBorder(width: CGFloat, color: CGColor) {
        self.layer.borderColor = color
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
    }
    
    func removeBorder() {
        self.layer.borderWidth = 0
    }
}
