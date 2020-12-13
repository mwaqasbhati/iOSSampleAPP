//
//  CatalogDetailCoordinator.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import UIKit

class CatalogDetailCoordinator: Coordinator {
    
    let navigation: UINavigationController
    var catalog: Result?
    
    required init(_ navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        if let catalogDetail = UIStoryboard.main.instatiate(storybordID: CatalogStoryboardID.catalogDetail) as? CatalogDetailViewController {
            if let catalog = catalog {
                catalogDetail.viewModel = CatalogDetailViewModel(catalog)
            }
            navigation.pushViewController(catalogDetail, animated: true)
        }
    }
    
}
