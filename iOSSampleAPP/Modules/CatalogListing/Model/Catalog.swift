//
//  Catalog.swift
//  iOSSampleAPP
//
//  Created by Muhammad Waqas on 10/12/2020.
//

import Foundation

// MARK: - Welcome
struct Catalog: Codable {
    let results: [Result]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Codable {
    let key: JSONNull?
}

// MARK: - Result
struct Result: Codable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
