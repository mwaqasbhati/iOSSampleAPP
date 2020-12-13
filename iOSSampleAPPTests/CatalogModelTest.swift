//
//  ResultModelTest.swift
//  iOSSampleAPPTests
//
//  Created by Muhammad Waqas on 13/12/2020.
//

import XCTest
@testable import iOSSampleAPP

class CatalogModelTest: XCTestCase {

    let expectedPrice = "AED 5"
    let expectedName = "Notebook"
    let expectedUid = "4878bf592579410fba52941d00b62f94"
    let expectedImageIDS: [String] = ["9355183956e3445e89735d877b798689"]
    let expectedImageUrls = [
        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=D%2FFftKFo6%2FcTRMIUmEL2u8XmdNk%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
      ]
    let expectedImageUrlsThumbnails = [
        "https://demo-app-photos-45687895456123.s3.amazonaws.com/9355183956e3445e89735d877b798689-thumbnail?AWSAccessKeyId=ASIASV3YI6A4UIVE73VF&Signature=t0cNx0ZkyZ3GKbWxkrs2aJLcRUw%3D&x-amz-security-token=IQoJb3JpZ2luX2VjEN%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQC8XUp3x%2FIpXUNtfAZwg5BeoBnJt%2Bdys3kjko4sRTtpTgIgIpawvAnFSTvAODXf1OOFft2UdMGz42Wh%2FTCa8Wo9LuEqzgEIeBACGgwxODQzOTg5NjY4NDEiDEIgi6X7RVFDHLCrgSqrAXvAXbcrzwTeAT0L%2Bl0dIexMPnNNDbRsMK%2BNx%2BTMSDvcX3TUlyCpsbPibmAJZEbVUMRVCEKYIYVY1MZ0oIARo3wt%2B2CA7PRpiHWsD3a0fBcToZz%2FCLvFfOeX57Fcd42xG2RI36A1%2B8KbMdy%2B1zelifLwU9OuGOP6E6b6BzP4PLs1BgYGVe3%2BR9LIYYzfSZ7yvO%2B0l8kKdFNMShpgjaC2DvVaVzXuYHesrpeBljCi58j%2BBTrgAfKUEUvz9ACtu9KV5Cm5Ysk4TH6YkuzDaqQ8USn3KBK7hqyGKB76z5g0Bz2SUG9qH6gVaLilGDQJiPY%2BRVtzmrBlo3n%2BxgZ8xA0e6OWlW%2FKATAlUoz%2BcWJIguPGZ8FOUipMuKDJZyGT6ZyMR1atWK6TPaE9T9irAzPsyu2rUfAWmSBfPRvYRtmxJujBmCielOjoeT9FSAQZbAoRvckVwBbwgBptmucwy4NyEh14Qhds%2FsAyJ%2BmcBctRDBxWuyZDwXu6TtdYiuEHurASQ1vhEKajBjvypn%2F7qyTgA0xX1lrHj&Expires=1607614901"
      ]
    let expectedCreatedAt: String = "2019-02-24 04:04:17.566515"
    
    var systemUnderTest: Result!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() {
        super.setUp()
        
        systemUnderTest = Result(createdAt: expectedCreatedAt,
                                 price: expectedPrice,
                                 name: expectedName,
                                 uid: expectedUid,
                                 imageIDS: expectedImageIDS,
                                 imageUrls: expectedImageUrls,
                                 imageUrlsThumbnails: expectedImageUrlsThumbnails)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSUT_InitializesPrice() {
        XCTAssertEqual(systemUnderTest.price, expectedPrice)
    }
    
    func testSUT_InitializescreatedAt() {
        XCTAssertEqual(systemUnderTest.createdAt, expectedCreatedAt)
    }
    
    func testSUT_Initializesuid() {
        XCTAssertEqual(systemUnderTest.uid, expectedUid)
    }
    
    func testSUT_InitializesimageIDS() {
        XCTAssertEqual(systemUnderTest.imageIDS, expectedImageIDS)
    }
    
    func testSUT_InitializesimageUrls() {
        XCTAssertEqual(systemUnderTest.imageUrls, expectedImageUrls)
    }
    
    func testSUT_InitializesimageUrlsThumbnails() {
        XCTAssertEqual(systemUnderTest.imageUrlsThumbnails, expectedImageUrlsThumbnails)
    }
    
    
 }

