//
//  CatalogListingViewModel.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

protocol CatalogListingViewModelProtocol {
    var numberOfItems: Int { get }
    var didGetItems: (() -> Void)? { get set }
    var didFail: ((APIError) -> Void)? { get set }

    func itemFromIndex(_ index: Int) -> CatalogCellViewModelProtocol?
    func getDetailItem(_ index: Int) -> Result?
    func fetchCatalogItems()
}

class CatalogListingViewModel: CatalogListingViewModelProtocol {
    
    var didGetItems: (() -> Void)?
    var didFail: ((APIError) -> Void)?
    
    private var catalogItems: [Result]?
    private var repository: CatalogRepositoryProtocol
    
    var numberOfItems: Int {
        return catalogItems?.count ?? 0
    }
    
    init(_ repository: CatalogRepository) {
        self.repository = repository
    }
    
    func itemFromIndex(_ index: Int) -> CatalogCellViewModelProtocol? {
        if let item = catalogItems?[index] {
            return CatalogCellViewModel(item)
        }
        return nil
    }
    
    func getDetailItem(_ index: Int) -> Result? {
        if let item = catalogItems?[index] {
            return item
        }
        return nil
    }
    
    func fetchCatalogItems() {
        
        repository.getCatalog(type: .catalog) { [weak self] (result) in
            switch result {
            case .success(let items):
                self?.catalogItems = items.results
                self?.didGetItems?()
            case .failure(let error):
                self?.didFail?(error)
            }
            
        }
    }
    
}

