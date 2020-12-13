//
//  APIResult.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import Foundation

enum APIResult<T, APIError> {
    case success(T)
    case failure(APIError)
}
