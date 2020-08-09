//
//  ErrorsSpec.swift
//  Example-iOSTests
//
//  Created by Ben Chatelain on 8/9/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//


@testable import Example_iOS
import Quick
import Nimble

enum TestError: Error {
    case ohnoes
}

func throwingFunc() throws {
    throw TestError.ohnoes
}

class ErrorsSpec: QuickSpec {
    override func spec() {
        describe("a dolphin") {
            // New in Quick 3
            it("fails when an error is thrown") {
                try throwingFunc()
            }
        }
    }
}
