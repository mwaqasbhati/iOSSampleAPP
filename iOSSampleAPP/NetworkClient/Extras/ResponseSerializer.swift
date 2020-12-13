//
//  ResponseSerializer.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import Foundation

protocol ResponseSerializer: class {
    func serialize<T: Codable>(_ data: Data?,_ response: URLResponse?,_ error: Error?, completion: ((APIResult<T, APIError>) -> Void)?)
    func handleNetworkResponse(_ response: HTTPURLResponse) -> APIError
}

extension ResponseSerializer {
    func serialize<T: Codable>(_ data: Data?,_ response: URLResponse?,_ error: Error?, completion: ((APIResult<T, APIError>) -> Void)?) {
        
        guard error == nil else {
            completion?(.failure(APIError.notReachable))
            return
        }
        
        if let response = response as? HTTPURLResponse {
            let result = self.handleNetworkResponse(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion?(.failure(APIError.noData))
                    return
                }
                do {
                    print(responseData)
                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    print(jsonData)
                    let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                    completion?(.success(apiResponse))
                }catch {
                    print(error)
                    completion?(.failure(APIError.unableToDecode))
                }
            default:
                completion?(.failure(result))
            }
        }
    }
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> APIError {
        switch response.statusCode {
        case 200...299: return APIError.success
        case 401...500: return APIError.authenticationError
        case 501...599: return APIError.badRequest
        case 600: return APIError.outdated
        default: return APIError.failed
        }
    }
}
