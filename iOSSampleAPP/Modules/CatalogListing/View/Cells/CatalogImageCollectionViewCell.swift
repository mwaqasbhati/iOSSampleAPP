//
//  CatalogImageCollectionViewCell.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import UIKit
import Combine

protocol CatalogImageCellViewModelProtocol {
    var imageURL: String { get set }
}

class CatalogImageCellViewModel: CatalogImageCellViewModelProtocol {
    var imageURL: String
    
    init(_ imageURL: String) {
        self.imageURL = imageURL
    }
}

class CatalogImageCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "CatalogImage"
    @IBOutlet weak var catalogImage: UIImageView!
    var viewModel: CatalogImageCellViewModelProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        catalogImage.image = nil
    }
    
    func configure(_ viewModel: CatalogImageCellViewModelProtocol?) {
        self.viewModel  = viewModel
        guard let urlStr = viewModel?.imageURL, let url = URL(string: urlStr) else {
            return
        }
        
        catalogImage.downloadImage(from: url, placeholder:"placeHolder")
        
//        catalogImage.image = UIImage(named: "placeHolder")
//        ImageCache.publicCache.load(url: url as NSURL) { [weak self] (image) in
//            if let img = image {
//                self?.catalogImage.image = img
//            }
//        }
    }
    
}
