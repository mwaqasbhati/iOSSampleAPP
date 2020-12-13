//
//  ViewController.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import UIKit

class CatalogListingViewController: UIViewController {

    // MARK:- Instance Variables
    @IBOutlet weak var collectionView: UICollectionView?
    
    var viewModel: CatalogListingViewModelProtocol!
    
    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK:- Helper Methods
    private func setup() {
        addObservers()
        fetchCatalog()
    }
        
    private func fetchCatalog() {
        showHUD()
        viewModel.fetchCatalogItems()
    }
    
    private func addObservers() {
        
        viewModel.didGetItems = { [weak self] in
            DispatchQueue.main.async {
                self?.hideHUD()
                self?.collectionView?.reloadData()
            }
        }
        
        viewModel.didFail = { [weak self] error in
            DispatchQueue.main.async {
                self?.hideHUD()
                self?.showAlert(message: error.message)
            }
        }
    }

    // MARK:- Coordinator Methods
    private func moveToCatalogDetail(_ selectedIndex: Int) {
        if let navC = self.navigationController {
            let coordinator = CatalogDetailCoordinator(navC)
            coordinator.catalog = viewModel.getDetailItem(selectedIndex)
            coordinator.start()
        }
    }
}

// MARK:- UICollectionViewDataSource
extension CatalogListingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.cellID, for: indexPath) as? CatalogCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(viewModel.itemFromIndex(indexPath.row))
        cell.viewModel?.didCellTap = { [weak self] in
            self?.moveToCatalogDetail(indexPath.row)
        }
        return cell
    }
    
}

// MARK:- UICollectionViewDelegate
extension CatalogListingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToCatalogDetail(indexPath.row)
    }
    
}

// MARK:- UICollectionViewDelegateFlowLayout
extension CatalogListingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 250)
    }
}
