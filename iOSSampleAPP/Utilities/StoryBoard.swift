//
//  StoryBoard.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 11/12/2020.
//

import UIKit

extension UIStoryboard {
    // MARK: - Storyboards
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    ///Helper method to use with Storyboard enum.
    func instatiate(storybordID: StoryboardIdentifiable) -> UIViewController {
        return self.instantiateViewController(withIdentifier: storybordID.identifier)
    }
}

protocol StoryboardIdentifiable {
    var identifier: String { get }
}

enum CatalogStoryboardID: String, StoryboardIdentifiable {
    var identifier: String {
        return self.rawValue
    }
    case catalogList = "CatalogListingViewController"
    case catalogDetail = "CatalogDetailViewController"
}
