//
//  CatalogTableViewCell.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelCount: UILabel!
    
    static let cellID = "Catalog"
    var viewModel: CatalogCellViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configure(_ viewModel: CatalogCellViewModelProtocol?) {
        self.viewModel  = viewModel
        labelName.text = viewModel?.name
        labelPrice.text = viewModel?.price
        collectionView.reloadData()
    }
}

extension CatalogCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.imageURLs.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogImageCollectionViewCell.cellID, for: indexPath) as? CatalogImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let imageURL = viewModel?.imageURLs[indexPath.row] {
            cell.configure(CatalogImageCellViewModel(imageURL))
        }
        return cell
    }
    
}

extension CatalogCollectionViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        labelCount.text = "\(indexPath.row + 1 )/\(viewModel?.imageURLs.count ?? 0)"
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didCellTap?()
    }
    
}

extension CatalogCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: self.collectionView.frame.size.height)
    }
}


