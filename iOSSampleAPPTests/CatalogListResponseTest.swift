//
//  CatalogListResponseTest.swift
//  iOSSampleAPPTests
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import XCTest
@testable import iOSSampleAPP

class CatalogListResponseTest: XCTestCase {

    var systemUnderTest: Catalog!

     private let inPutData = Data("""
    {
      "results": [
        {
          "created_at": "2019-02-24 04:04:17.566515",
          "price": "AED 5",
          "name": "Notebook",
          "uid": "4878bf592579410fba52941d00b62f94",
          "image_ids": [
            "9355183956e3445e89735d877b798689"
          ],
          "image_urls": [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=D%2FFftKFo6%2FcTRMIUmEL2u8XmdNk%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
          ],
          "image_urls_thumbnails": [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=t0cNx0ZkyZ3GKbWxkrs2aJLcRUw%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
          ]
        },
        {
          "created_at": "2019-02-23 07:56:26.686128",
          "price": "AED 500",
          "name": "Glasses",
          "uid": "bdf455e89f3b49f484d2a181b0268eab",
          "image_ids": [
            "46a0c97762ba449cb49b3575681a4d84"
          ],
          "image_urls": [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/46a0c97762ba449cb49b3575681a4d84?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=3tckJuJGHhZLp8g196QTOkJuUYE%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
          ],
          "image_urls_thumbnails": [
            "https://demo-app-photos-45687895456123.s3.amazonaws.com/46a0c97762ba449cb49b3575681a4d84-thumbnail?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=CZRs9gp42PMRSgj3hx3XIIVOTiI%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
          ]
        }
       ],
      "pagination": {
        "key": null
      }
    }
    """.utf8)

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        systemUnderTest = try? JSONDecoder().decode(Catalog.self, from: inPutData)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding_whenMissingType_itThrows() throws {
        AssertThrowsKeyNotFound("price", decoding: Catalog.self, from: try inPutData.json(deletingKeyPaths: "results.price"))
    }

    func testDecoding_whenMissingAttributes_itThrows() throws {
        AssertThrowsKeyNotFound("image_urls", decoding: Catalog.self, from: try inPutData.json(deletingKeyPaths: "results.image_urls"))
    }
        
    func testDecoding_WhenAllOK() throws {
        let _ = try JSONDecoder().decode(Catalog.self, from: inPutData)
        XCTAssertTrue(true)
    }
    
    func testDateTime() {
        XCTAssertEqual(systemUnderTest.results.first?.createdAt, "2019-02-24 04:04:17.566515")
    }
        
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

func AssertThrowsKeyNotFound<T: Decodable>(_ expectedKey: String, decoding: T.Type, from data: Data, file: StaticString = #file, line: UInt = #line) {
    XCTAssertThrowsError(try JSONDecoder().decode(decoding, from: data), file: file, line: line) { error in
        if case .keyNotFound(let key, _)? = error as? DecodingError {
            XCTAssertEqual(expectedKey, key.stringValue, "Expected missing key '\(key.stringValue)' to equal '\(expectedKey)'.", file: file, line: line)
        } else {
            XCTFail("Expected '.keyNotFound(\(expectedKey))' but got \(error)", file: file, line: line)
        }
    }
}

extension Data {
    func json(deletingKeyPaths keyPaths: String...) throws -> Data {
        let decoded = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as AnyObject

        for keyPath in keyPaths {
            decoded.setValue(nil, forKeyPath: keyPath)
        }

        return try JSONSerialization.data(withJSONObject: decoded)
    }
}
