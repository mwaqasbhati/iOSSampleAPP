//
//  Repository.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import Foundation

protocol Repository {
    static var environment : NetworkEnvironment { get }
    associatedtype T: EndPointType
    var router: Router<T> { get set }
}

extension Repository {
    static var environment: NetworkEnvironment { .production }
}
