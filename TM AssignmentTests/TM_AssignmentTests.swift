//
//  TM_AssignmentTests.swift
//  TM AssignmentTests
//
//  Created by apple on 12/28/18.
//  Copyright © 2018 apple. All rights reserved.
//

import XCTest
@testable import TM_Assignment


class TM_AssignmentTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testGetFeeds() {
        let viewModal:UserFeedViewModal = UserFeedViewModal()
        var usersFeedModel = [UserFeedResponceModal]()
        viewModal.getUsersFeed {
            usersFeedModel = Array(viewModal.usersfeedList)
            XCTAssertNotNil(usersFeedModel)
        
    }
    }
}
