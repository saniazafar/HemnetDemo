//
//  ViewController.swift
//  HemnetDemo
//
//  Created by Sania Zafar on 04/06/2022.
//

import UIKit

protocol PropertyListViewProtocol: AnyObject {
    func showAlert(with message: String)
}

class PropertyListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: PropertyListViewModel!
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionLayout.minimumLineSpacing = 0.0
        collectionLayout.minimumInteritemSpacing = 0.0
        collectionLayout.scrollDirection = .vertical

        return collectionLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        configureCollectionView()
    }
    
    private func setupViewModel() {
        viewModel = PropertyListViewModel()
        viewModel.fetchPropertiesForSale { [weak self] in
            self?.updateView()
        }
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.register(UINib(nibName: PropertyListCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PropertyListCollectionViewCell.cellIdentifier)
        collectionView.register(UINib(nibName: PropertyAreaCollectionViewCell.cellIdentifier, bundle: nil), forCellWithReuseIdentifier: PropertyAreaCollectionViewCell.cellIdentifier)
    }
    
    func updateView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PropertyListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.propertiesForSale.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = viewModel.propertiesForSale[indexPath.row]
        switch model.type {
        case .property, .highlightedProperty:
            return collectionView.dequeueReusableCell(withReuseIdentifier: PropertyListCollectionViewCell.cellIdentifier, for: indexPath)
        case .area:
            return collectionView.dequeueReusableCell(withReuseIdentifier: PropertyAreaCollectionViewCell.cellIdentifier, for: indexPath)
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let model = viewModel.propertiesForSale[indexPath.row]
        let viewModel = PropertyListCellViewModel(property: model)
        if let categoryCell = cell as? PropertyListCollectionViewCell {
            categoryCell.configureUI(with: viewModel)
        } else if let categoryCell = cell as? PropertyAreaCollectionViewCell {
            categoryCell.configureUI(with: viewModel)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PropertyDetailViewController")
            present(detailVC, animated: true)
        } else {
            showAlert(with: "Oops, sorry! no further information is available for this property")
        }
    }
}

extension PropertyListViewController: PropertyListViewProtocol {
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: "Hemnet", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}
