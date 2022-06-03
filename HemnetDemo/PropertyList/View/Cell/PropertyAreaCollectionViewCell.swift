//
//  PropertyAreaCollectionViewCell.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 06/06/2022.
//

import UIKit
import SDWebImage

class PropertyAreaCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var averagePriceLabel: UILabel!
    
    static var cellIdentifier: String {
        "PropertyAreaCollectionViewCell"
    }
    
    func configureUI(with viewModel: PropertyListCellViewModelProtocol) {
        if let imageUrl = URL(string: viewModel.imageLink) {
            imageView.sd_setImage(with: imageUrl)
        }
        titleLabel.text = viewModel.type.rawValue
        areaLabel.text = viewModel.area
        ratingLabel.text = viewModel.ratingFormatted
        averagePriceLabel.text = viewModel.averagePrice
    }
}
