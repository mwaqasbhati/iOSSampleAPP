//
//  CatalogDetailViewController.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import UIKit

class CatalogDetailViewController: UIViewController {
    
    // MARK:- Instance Variables
    @IBOutlet weak var imageViewCatalog: UIImageView?
    @IBOutlet weak var labelPrice: UILabel?
    @IBOutlet weak var labelCreationDate: UILabel?
    @IBOutlet weak var labelName: UILabel?
    @IBOutlet weak var activityLoader: UIActivityIndicatorView?
    
    var viewModel: CatalogDetailViewModelProtocol!

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK:- Helper Methods
    private func setup() {
        configureUI()
    }
    
    private func configureUI() {
        
        guard let viewModel = viewModel else {
            return
        }
        if let urlStr = viewModel.imageURLs.first, let url = URL(string: urlStr) {
            activityLoader?.startAnimating()
            imageViewCatalog?.downloadImage(from: url, placeholder: Constant.placeholer) { [weak self] (image) in
                self?.activityLoader?.stopAnimating()
                self?.imageViewCatalog?.image = image
            }
        }
        labelName?.text = viewModel.name
        labelPrice?.text = viewModel.price
        labelCreationDate?.text = viewModel.creationDate
        
    }
}
