//
//  Example-iOSTests.swift
//  UnitTestingWithQuick
//
//  Created by Ben Chatelain on 3/8/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//

@testable import Example_iOS
import XCTest

class Example_iOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // This test is disabled in the Xcode scheme
    func testExample() throws {    }

    // I prefer to disable tests in code
    func DISABLED_testBasicArithmatic() throws {
        XCTAssertEqual(1 + 1, 3)
        XCTAssertEqual(1 + 1, 3, "Make sure libKindergartenMath is loaded")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
