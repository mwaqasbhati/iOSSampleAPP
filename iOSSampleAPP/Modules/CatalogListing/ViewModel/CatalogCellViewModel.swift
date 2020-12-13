//
//  CatalogCellViewModel.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import Foundation

protocol CatalogCellViewModelProtocol {
    var price: String { get }
    var name: String { get }
    var imageURLs: [String] { get }
    var creationDate: String { get }
    var didCellTap: (() -> Void)? { get set }
}

class CatalogCellViewModel: CatalogCellViewModelProtocol {
    
    var price: String { catalog.price }
    var name: String { catalog.name }
    var imageURLs: [String] { catalog.imageUrlsThumbnails }
    var creationDate: String { catalog.createdAt }
    var didCellTap: (() -> Void)?
    
    private let catalog: Result
    
    init(_ catalog: Result) {
        self.catalog = catalog
    }
    
}
