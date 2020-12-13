//
//  CatalogDetailViewModel.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

protocol CatalogDetailViewModelProtocol {
    var price: String { get }
    var name: String { get }
    var imageURLs: [String] { get }
    var creationDate: String? { get }
}

class CatalogDetailViewModel: CatalogDetailViewModelProtocol {

    var price: String { catalog.price }
    var name: String { catalog.name }
    var imageURLs: [String] { catalog.imageUrls }
    var creationDate: String? {
        let date = catalog.createdAt.toDate() ?? Date()
        let formatter = RelativeDateTimeFormatter()
        let dateString = formatter.localizedString(for: date, relativeTo: Date())
        return dateString
    }

    private var catalog: Result
    
    init(_ catalog: Result) {
        self.catalog = catalog
    }
    
}

extension String {
    
    func toDate(_ format: String = "YYYY-mm-dd HH:mm:ss.SSSSSS") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
