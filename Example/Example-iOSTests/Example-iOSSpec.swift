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

struct Dog {}

class Example_iOSSpec: QuickSpec {
    override func spec() {
        describe("basic addition") {
            xit("to equal three") {
                expect(1 + 1).to(equal(3))
                // failed - expected to equal <3>, got <2>

                expect(1 + 1).to(equal(3), description: "Make sure libKindergartenMath is loaded")
            }

            it("does not compile") {
                //expect(1 + 1).to(equal("Squee!"))
            }
            it("is close") {
                expect(1.2).to(beCloseTo(1.1, within: 0.1))
                expect(1.2) == (1.1, 0.1)
                expect(1.2) ≈ 1.1999 // default delta is 0.0001
            }
            it("is great") {
                expect(3).to(beGreaterThan(2))
                expect(3) > 2
            }
            it("has a substring") {
                expect("seahorse").to(contain("sea"))
            }
            it("does not contain a string") {
                expect(["Atlantic", "Pacific"]).toNot(contain("Mississippi"))
            }
            it("is nil") {
                let dog: Dog? = nil
                expect(dog).to(beNil())
                expect(dog) == nil
            }
            it("') {

            }
        }
    }
}
