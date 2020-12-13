//
//  MovieEndPoint.swift
//  NetworkLayer
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

enum CatalogEndpoint {
    case catalog
}

extension CatalogEndpoint: EndPointType {
    
    var environmentBaseURL : String {
        switch CatalogRepository.environment {
        case .production: return Constant.base_url
        case .qa: return Constant.base_url
        case .staging: return Constant.base_url
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .catalog:
            return Constant.catalog_path
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


