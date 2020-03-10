//
//  Dolphin.swift
//  Example-iOSTests
//
//  Created by Ben Chatelain on 3/9/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//


@testable import Example_iOS
import Quick
import Nimble

enum Something {
    case boring
    case interesting
}

struct Dolphin {
    var clicks = 0
    mutating func emitClick() { clicks += 1 }
    mutating func near(something: Something) { for _ in 1...3 { emitClick() } }
}

class DolphinSpec: QuickSpec {

    override func spec() {
        var dolphin: Dolphin!

        describe("a dolphin") {
//            beforeEach { dolphin = Dolphin() }

            describe("its click") {
                beforeEach { dolphin = Dolphin() }

                it("starts at zero") {
                    expect(dolphin.clicks) == 0
                }
                context("when the dolphin is near something interesting") {
                    beforeEach { dolphin = Dolphin() }

                    it("is emitted three times") {
                        dolphin.near(something: .interesting)
                        expect(dolphin.clicks) == 3
                    }
                }
            }
        }
    }
}
