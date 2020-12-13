//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

