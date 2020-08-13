theme: Copy of Titillium
slidenumbers: true
slide-transition: fade(0.3)

# Unit Testing with [Quick](https://github.com/Quick/Quick)

Presented at [360|iDev 2020](https://360idev.com/sessions/unit-testing-with-quick-and-nimble/)
by @phatblat

![fit](Images/quick_logo.png)

^

---

# ... and [Nimble](https://github.com/Quick/Nimble)

![fit](Images/quick_logo.png)

---

[.footer: github.com/phatblat/UnitTestingWithQuick]

# Slides & Examples

## [phatblat/UnitTestingWithQuick](https://github.com/phatblat/UnitTestingWithQuick)

![](Images/QuickSpec screenshot.png)

---

# testAsyncNetworkCallUpdatesLabelWithGreenCheckEmoji()

---

# @[phatblat](https://twitter.com/phatblat)

- Ben Chatelain
- Chief iOS Engineer
- Kaiser Permanente
- Manage suite of ~30 iOS & Android libs
- open source: Quick, mas, Objective-Git

![right](Images/BChatelain.jpg)

^
- photo by Fuad Kamal at 2018 360|iDev
- indie app dev 2008-2009

---

# Quick & Nimble

Open Source

- Quick/[Quick](https://github.com/Quick/Quick)
  - BDD-style testing framework, used to define examples.
- Quick/[Nimble](https://github.com/Quick/Nimble)
  - Matcher framework used to express expectations.

^
- Quick & Nimble work together
- Core contributor
- BDD style framework
- Both also support Objective-C

---

# BDD

- _Behavior-Driven Development_
- Don't test code
- Verify behavior
- Object-oriented design
- Similar to user story
- Behavior spec: semi-formal format
- Gherkin: Scenario, Given, When, Then

^
- What is BDD?
- Nouns and verbs

---

# User Story

[As a](about://blank) store owner,
[I want](about://blank) to add items back to inventory when they are returned or exchanged,
[so that](about://blank) I can track inventory.

^
- Answers the who, what and why?

---

# Gherkin

[Scenario:](about://blank) Items returned for refund should be added to inventory.
[Given](about://blank) that a customer previously bought a black sweater from me
[and](about://blank) I have three black sweaters in inventory,
[when](about://blank) they return the black sweater for a refund,
[then](about://blank) I should have four black sweaters in inventory.

^
- cucumber

---

# Spec

![fit](Images/quick_logo.png)

[describe](about://blank) inventory
[context](about://blank) an item is returned
[it](about://blank) will increment the item count
[expect](about://blank) count is 4

^
- pseudocode for spec test

---

# RSpec

- Behaviour Driven Development for Ruby.
- "Making TDD Productive and Fun."

![inline](Images/rspec.png)

^
- but first! Quick was inspired by RSpec
- Ruby testing framework that inspired Quick & Nimble
- BDD-lite
- point out: describe, context, it, and expect

---

# QuickSpec

```swift

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    describe("the 'Documentation' directory") {
      it("has everything you need to get started") {
        let sections = Directory("Documentation").sections
        expect(sections).to(contain("Organized Tests with Quick Examples and Example Groups"))
        expect(sections).to(contain("Installing Quick"))
      }

      context("if it doesn't have what you're looking for") {
        it("needs to be updated") {
          let you = You(awesome: true)
          expect{you.submittedAnIssue}.toEventually(beTruthy())
        }
      }
    }
  }
}
```

---

# `describe`

```swift
describe("the thing") { /* closure */ }
```

- Describes the thing being tested.
- Groups examples.
- Serves as a prefix for the actual test name.
- Analogous to `XCTestCase`

^
- noun
- Somewhat analygous to XCTestCase, but depends how you use it
- Essentially a suite of tests.
- _Can_ be nested, but don't.

---

# `context`

```swift
context("when dark mode is enabled") { /* closure */ }
```

- Describes a condition.
- Optional alternate 2nd-Nth level of grouping for examples.

^
- starts with "when" or "if"
- the "when" of gherkin

---

# `it`

```swift
it("calculates an average score") { /* closure */ }
```

- Describes an example behavior.
- Contains assertions (expectations).
- _One expectation per example._

^
- starts with a verb like "is"
- "one expectation" is my advice, but I feel very strongly about this.
- If more than one expectation, each should probably include custom description.

---

# Setup & Teardown

```swift
var dolphin: Dolphin!
beforeEach { dolphin = Dolphin() }
afterEach { dolphin = nil }
```

- Contains logic to be run before/after each function _in the same scope_.
- ✨ Can be placed inside any/every `describe` and `context`.

^
- describe/context/it functions
- not necessarily before each `it`

---

# ✨ Nesting FTW!

```swift
describe("dolphin") {
  beforeEach { dolphin = Dolphin() }
  context("when out of water") {
    beforeEach { dolphin.airborne = true }
    context("and making noise") {
      beforeEach { dolphin.vocalizationLevel = 5 }
      it("is loud") { /* closure */ }
      it("can be heard from 100m away") { /* closure */ }
```

---

# Suite Setup & Teardown

```swift
override func spec() {
  beforeSuite {
    OceanDatabase.createDatabase(name: "test.db")
    OceanDatabase.connectToDatabase(name: "test.db")
  }
  afterSuite {
    OceanDatabase.teardownDatabase(name: "test.db")
  }
  describe("a dolphin") {}
```

^
- All beforeSuite/afterSuite closures will be executed before/after all tests are run/finished.
- spec method is context?
- No guarantee of ordering for closures execution.

—--

# Disabled Test (Xcode)

## Test Navigator

- Enable/disable using righ-click context menu.
- Actually updates current scheme file.

![inline](Images/disabled_xctest_xcode_navigator.png)

—--

# Disabled Test (Xcode 2)

## Scheme Editor

- Edit scheme to enable/disable tests.


![inline](Images/disabled_xctest_xcode_scheme.png)

^
- Test configuration separate from tests (in scheme).
- Had CI not honor test configuration in scheme.

—--

# Disabled Test (Quick)

```swift
xit("this example is disabled") { code.compiles() == yes }
```

- Prefix any example with `x` to disable.
- Controlled in code.
- Disabled examples do not show in Test Navigator

^
- Easier to see, more intuitive.
- Intended to be temporary.
- Don't forget to undo focus before commit.
- I don't recommend commenting out tests because code won't compile.
- If you don't want it to compile, delete it.

—--

# ✨ Disabled Test Suite

```swift
xdescribe("the thing") {
xcontext("when dark mode is enabled") {
xit("this example is disabled") { code.compiles() == yes }
```

- Prefix any Quick function(s) with `x` to disable everything under that scope.
- Any combination of disabled functions will be skipped.

^
- functions: describe, context, it

—--

# ✨ Focused Test

```swift
fit("is focused") { expect(example).toRun(true) }
it("will be ignored") { code.compiles() == yes }
```

- Prefix any example with `f` to focus.
- Only the focused example(s) will be run.

—--

# ✨ Focused Test Suites

```swift
fdescribe("the thing") {
fcontext("when dark mode is enabled") {
fit("is focused") { expect(example).toRun(true) }
```

- Prefix any Quick function(s) with `f` to focus everything under that scope.
- Only the focused example(s) will be run.
- All focused examples will be run.

^
- Intended to be temporary.
- Don't forget to undo focus before commit.

---

[.autoscale: false]

# Test Readability

XCTest

```swift
func testDolphin_click_whenTheDolphinIsNearSomethingInteresting_isEmittedThreeTimes() {
  // ...
}
```

Quick

```swift
describe("a dolphin") {
  describe("its click") {
    context("when the dolphin is near something interesting") {
      it("is emitted three times") {
        // ...
      }
    }
  }
}
```

^
- XCTest name is good practice
- still constrained to allowed symbols for method name
- strings more readable with spaces

---

# ✨ Quick Test Names

![inline](Images/dolphin_spec.png)

---

# ✨ More Test Names

![inline](Images/outlet-action-tests-pass.png)

Names are automatically built from describe/context/it descriptions

^
Obviates need for failure descriptions

---

# Don't Use Properties

```swift

class TableOfContentsSpec: QuickSpec {
  var dolphin: Dolphin!
  override func spec() {
    describe("dolphin") {
      beforeEach { self.dolphin = Dolphin() }
```

^
- without the `self.` you get an error: 
- Reference to property 'dolphin' in closure requires explicit 'self.' to make capture semantics explicit

---

# Use Local Variables

```swift

class TableOfContentsSpec: QuickSpec {
  override func spec() {
    var dolphin: Dolphin!
    describe("dolphin") {
      beforeEach { dolphin = Dolphin() }
```

^
- style: Use ! liberally in tests
- there should be only one happy path through the test

—--

# Nimble

^
- so jack is quick, but is he nimble?

—--

# Nimble

- Matcher framework
- Swift and Objective-C
- used to test your `expect`-ations

^
- quick tour of matchers

---

# Equality

```swift
expect(1 + 1).to(equal(2))
expect(1 + 1) == 2

expect(1 + 1).toNot(equal(3))
expect(1 + 1) != 3
```

^
- Operator overloading

---

# Decimal Precision

```swift
expect(1.2).to(beCloseTo(1.1, within: 0.1))
expect(1.2) == (1.1, 0.1)
expect(1.2) ≈ 1.1999
```

^
- default delta is 0.0001

---

# Comparison

```swift
expect(2).to(beLessThan(3))
expect(2) < 3

expect(3).to(beLessThanOrEqualTo(3))
expect(3) <= 3

expect(5).to(beGreaterThan(3))
expect(5) > 3

expect(5).to(beGreaterThanOrEqualTo(5))
expect(5) >= 5
```

---

# Nillability

```swift
var dog: Dog? = nil
expect(dog).to(beNil())
expect(dog) == nil
```

---

# Identity

```swift
expect(actual).to(beIdenticalTo(expected))
expect(actual) === expected

expect(actual).toNot(beIdenticalTo(expected))
expect(actual) !== expected
```

^
- same pointer address

---

# String Contents

```swift
expect("seahorse").to(contain("sea"))
```

---

# Collection Contents

```swift
expect(["Atlantic", "Pacific"]).toNot(contain("Mississippi"))
```

^
- `notTo` is an alias of `toNot`

---

# Type Checking

### Type Membership

```swift
expect(1).to(beAKindOf(Int.self))
expect("turtle").to(beAKindOf(String.self))
```

### Exact Type

```swift
expect(1).to(beAnInstanceOf(Int.self))
expect("turtle").to(beAnInstanceOf(String.self))
```

^
- Nimble supports checking the type membership of any kind of object, whether Objective-C conformant or not

—--

# Type Safety

Nimble

```swift
it("does not compile") {
  expect(1 + 1).to(equal("Squee!"))
  // Cannot convert value of type 'Int' to expected argument type 'String?'
```

XCTest

```swift
func testComparingDifferentTypes() throws {
  XCTAssertEqual("Squee!", 1 + 1)
  // Cannot convert value of type 'String' to expected argument type 'Int'
```

^
- XCTest arguments are 

---

# Custom Failure Message

Nimble

```swift
expect(1 + 1).to(equal(3))
// failed - expected to equal <3>, got <2>

expect(1 + 1).to(equal(3), description: "Make sure libKindergartenMath is loaded")
// failed - Make sure libKindergartenMath is loaded
// expected to equal <3>, got <2>
```

XCTest

```swift
XCTAssertEqual(1 + 1, 3, "Make sure libKindergartenMath is loaded")
// XCTAssertEqual failed: ("2") is not equal to ("3") - Make sure libKindergartenMath is loaded
```

^
- Don't use `description:` as quick example names are good enough.
- Especially if you only have one `expect` per example.

—--

# Async Test

```swift
expect(ocean.isClean).toEventually(beTruthy())
```

---

# Async Test

```swift
waitUntil { done in
    service.authenticate(with: credentials) { result in
        expect(result).to(beSuccess { session in
            expect(session).toNot(beNil())
            expect(session.token) == "session token"
            expect(session.user).toNot(beNil())
        })
        done()
    }
}
```

—--

# ✨ Custom Matcher

```swift
expect(result).to(beFailure { error in
  expect(error) == .searchFailed
})

func beFailure(test: @escaping (MASError) -> Void = { _ in }) -> Predicate<Result<(), MASError>> {
  return Predicate.define("be <failure>") { expression, message in
    if let actual = try expression.evaluate(),
      case let .failure(error) = actual {
        test(error)
          return PredicateResult(status: .matches, message: message)
      }
      return PredicateResult(status: .fail, message: message)
  }
}
```

---

# Quick Caveats

- Easy to forget disabled/focused tests.
- Cannot run single example using ✅ or 🛑 in editor gutter.
- Clicking on Quick example in Test Navigator doesn't navigate to code.
- Quick tests don't display in Test Navigator until tests have been run.
- No support for performance tests.
- External dependency.

^
- New tests/examples also won't display until you run tests again.
- Once test class has been discovered, green/red annotations will show in Xcode editor at class level.
- Quick and XCTest can be mixed in a project.

---

# Demo! 💥

---

# testAsyncNetworkCallUpdatesLabelWithGreenCheckEmoji()

^
- so the next time you are updating a test like this

---

# 👌🏻

```swift
describe("a label") {
  context("after network call") {
    it("shows a green check emoji") {
      expect(label.title) == "✅"
    }
  }
}
```

^
- Remember that there is a better way...

---

# iOS Unit Testing by Example

by Jon Reid
[qualitycoding.org](https://qualitycoding.org)


[https://pragprog.com/titles/jrlegios/](https://pragprog.com/titles/jrlegios/)

![iOS Book, fit](Images/jrlegios-750.jpg)

^
- Pragmatic Bookshelf

---

> Tests that take too long to run end up not being run.
> -- [Michael Feathers](https://www.goodreads.com/author/quotes/25201.Michael_C_Feathers)

---

# References

![Matrix background](Images/matrix.png)

- [Unit Testing With Quick](https://github.com/phatblat/UnitTestingWithQuick) - Slides & Code Samples
- [Quick](https://github.com/Quick/Quick)
  - [Quick Docs](https://github.com/Quick/Quick/blob/master/Documentation/en-us/README.md)
- [Nimble](https://github.com/Quick/Nimble)
- Jon Reid
  - [Quality Coding](https://qualitycoding.org/)
  - [iOS Unit Testing By Example](https://pragprog.com/book/jrlegios/ios-unit-testing-by-example) 📕

---

# References 2

![Matrix background](Images/matrix.png)

- [BDD](https://en.wikipedia.org/wiki/Behavior-driven_development)
- Inspirations
  - [RSpec](https://rspec.info/) for Ruby
  - [Specta](https://github.com/specta/specta) for Objective-C
  - [Cedar](https://github.com/pivotal/cedar) for Objective-C
- [Deckset app](https://www.deckset.com/)
- [mmhmm app](https://www.mmhmm.app/)
