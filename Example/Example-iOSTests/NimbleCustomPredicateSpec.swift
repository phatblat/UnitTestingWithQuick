//
//  NimbleCustomPredicateSpec.swift
//  UnitTestingWithQuick
//
//  Created by Ben Chatelain on 3/8/20.
//  Copyright © 2020 Ben Chatelain. All rights reserved.
//

@testable import Example_iOS
import Quick
import Nimble

class NimbleCustomPredicateSpec: QuickSpec {
    override func spec() {
        describe("basic addition") {
            xit("to equal three") {
                expect(1 + 1).to(equal(3))
                // failed - expected to equal <3>, got <2>

                expect(1 + 1).to(equal(3), description: "Make sure libKindergartenMath is loaded")
            }
        }
    }
}


// Custom Nimble matcher
func beActionsRequired(validate: @escaping ([AuthAction], InterruptSession, User) -> Void) -> Predicate<AuthResult> {
    return Predicate.define("be <actionsRequired>") { expression, message in
        if let actual = try expression.evaluate(),
            case let .actionsRequired(actions, session, user) = actual {
            validate(actions, session, user)
            return PredicateResult(status: .matches, message: message)
        }
        return PredicateResult(status: .fail, message: message)
    }
}
