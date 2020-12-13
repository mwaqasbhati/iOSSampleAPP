//
//  APIError.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import Foundation

enum APIError: Error {
    case success
    case authenticationError
    case badRequest
    case outdated
    case failed
    case noData
    case unableToDecode
    case notReachable
    case unknown
    
    var message: String {
        switch self {
        case .success:
            return ""
        case .authenticationError:
            return "You need to be authenticated first."
        case .badRequest:
            return "Bad request"
        case .outdated:
            return "The url you requested is outdated."
        case .failed:
            return "Network request failed."
        case .noData:
            return "Response returned with no data to decode."
        case .unableToDecode:
            return "We could not decode the response."
        case .notReachable:
            return "Network connectivity issues, please try again."
        case .unknown:
            return "Unknow error occur, please try again."
        }
    }
}
