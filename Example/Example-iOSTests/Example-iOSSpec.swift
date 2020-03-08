//
//  Example-iOSSpec.swift
//  UnitTestingWithQuick
//
//  Created by Ben Chatelain on 3/8/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//

@testable import Example_iOS
import Quick
import Nimble

class Example_iOSSpec: QuickSpec {
    override func spec() {
        describe("basic addition") {
            it("to equal three") {
                expect(1 + 1).to(equal(3))
                // failed - expected to equal <3>, got <2>

                expect(1 + 1).to(equal(3), description: "Make sure libKindergartenMath is loaded")
            }
        }
    }
}
