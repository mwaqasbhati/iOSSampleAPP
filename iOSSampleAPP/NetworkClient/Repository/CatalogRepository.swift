//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

protocol CatalogRepositoryProtocol {
    func getCatalog(type: CatalogEndpoint, completionBlock: ((APIResult<Catalog, APIError>) -> Void)?)
}

class CatalogRepository: CatalogRepositoryProtocol, Repository, ResponseSerializer {
    
    var router: Router<CatalogEndpoint>
            
    init(_ router: Router<CatalogEndpoint>) {
        self.router = router
    }
    
    func getCatalog(type: CatalogEndpoint, completionBlock: ((APIResult<Catalog, APIError>) -> Void)?) {
        
        router.request(type) { [weak self] (data, response, error) in
            self?.serialize(data, response, error, completion: completionBlock)
        }
        
    }
}
