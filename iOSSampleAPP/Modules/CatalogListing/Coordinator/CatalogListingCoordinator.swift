//
//  CatalogListingCoordinator.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import UIKit

class CatalogListingCoordinator: Coordinator {
    
    private let navigation: UINavigationController
    
    required init(_ navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        if let listingVC = UIStoryboard.main.instatiate(storybordID: CatalogStoryboardID.catalogList) as? CatalogListingViewController {
            listingVC.viewModel = CatalogListingViewModel(CatalogRepository(Router<CatalogEndpoint>()))
            navigation.pushViewController(listingVC, animated: true)
        }
    }
    
}
