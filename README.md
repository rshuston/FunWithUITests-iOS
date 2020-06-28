#  Fun With UI Tests (iOS)

This project illustrates how you can use Xcode's XCTest frameworks to perform both unit
testing and UI testing activities in the development of an iOS project.

This project was created under Xcode 11.5, Swift Language Version 5.0, and targeted for
iOS 13.5.

## Application Overview

The application is a Single-View app that navigates among three view controllers. The "Home"
view controller is embedded in a navigation controller. The second view controller, "Foo," is
pushed onto and popped from the navigation stack using a standard "Show" seque. The
third view controller, "Bar," is presented via the standard UIViewController "present" and
"dismiss" mechanism.

The Home view controller implements a simple temperature converter to illustrate how unit
tests can easily exercise code that is not governed by UIKit. This also allows for the application
of TDD practices in iOS projects.

## Testing Overview

There are many organized testing philosophies (e.g., the "Test Pyramid") that each claim to
be the silver bullet of all testing strategies. As a pragmatist, I generally look to the core
goal, which is to test what you can early without jeopardizing your development effort, tools,
environment, etc. This project exercises the following testing layers:

1. Low-Level White-Box Testing (i.e., unit testing)
2. Component Integration Testing (i.e., integration testing)
3. High-Level Black-Box Testing (i.e., acceptance testing)

Layer 1 is where the TemperatureConverter class is exercised using unit tests. Layer 2 is where
the integration of an operational TemperatureConverter object is exercised from the view controller.
Layer 3 is where the high-level operational features of the application are exercised.

The UI testing must be done at the application level, and so its role is more geared towards
acceptance testing and quality regression testing. While there are situations where you can
use UI testing in a TDD fashion, those situations are limited to the external behavior of an
application, whereas TDD at the unit-test level allows you more flexibility with test-double
strategies (e.g., stubs, fakes, mocks, spies, etc.).

A key ingredient for success in testing is to make your architecture testable from the outset.
I could have just incorporated the temperature conversion functions into the Home view
controller, but then that would have needlessly coupled the conversion behavior with the
actual view controller behavior, making the unit testing of the class incomplete (e.g., it makes
little sense to unit-test IBAction methods or viewDidLoad() methods since they are so heavily
dependent on integrating with UIKit operations).

In order to make UI testing more workable, I use Apple's Accessibility Identifiers for things
like UITextFields so that a test can easily reference them at run time. I didn't need to set
the identifiers for everything; I only set them when I have a situation where there are more
than two elements on a screen that have identical characteristics, such as two UITextFields.

## Note: Beware the Apple iOS Simulator Keyboard Bug!

While there are many (did I say _many_, sorry, I mean __MANY!__) annoying quirks and bugs with
Apple's tools that drive me insane, one particular annoyance is the inability to consistently
control the state of the keyboard in the iOS simulator. The ability to connect my Mac keyboard
and use it on the simulator is extremely handy, but when it comes to actual UI testing, you need
the actual device keyboard. You may have it switched off in your simulator setting, but for some
reason, the simulator won't always observe your wishes and will happily ignore all input. Quite
maddening! It does ineed seem that Apple has adopted the model where

`XCTAssertEqual( Features / (Bugs + 1) , Constant )`

(We need the ghost of Steve Jobs to return and give the kids at Apple a serious spanking so
that they stop breaking things that used to work correctly!)

So, if you find your UI tests not working correctly, make sure you toggle the Keyboard settings in
the Simulater I/O menu until the keyboard behaves properly (you can use the "Shift-Cmd-K" key
combination to do the toggling). You might have to toggle it a few times to make sure the
simulator knows you really mean business.

## Testing from the Terminal

You can perform testing from the macOS Terminal. This is useful for CI and other automated
activities. Here are some useful command examples, using the "iPhone SE (2nd generation)"
simulator, configured for iOS=13.5.

### Show available testing destinations

```
instruments -s devices
```

### Build for testing

```
xcodebuild build-for-testing \
-project FunWithUITests.xcodeproj \
-scheme FunWithUITests \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation),OS=13.5'
```

### Build and run all tests

```
xcodebuild test \
-project FunWithUITests.xcodeproj \
-scheme FunWithUITests \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation),OS=13.5'
```

### Build and run selected test class

```
xcodebuild test \
-project FunWithUITests.xcodeproj \
-scheme FunWithUITests \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation),OS=13.5' \
-only-testing FunWithUITestsTests/TemperatureConverterTests
```

### Build and run selected test method

```
xcodebuild test \
-project FunWithUITests.xcodeproj \
-scheme FunWithUITests \
-destination 'platform=iOS Simulator,name=iPhone SE (2nd generation),OS=13.5' \
-only-testing FunWithUITestsTests/TemperatureConverterTests/testConvert_0C_to_32F
```
