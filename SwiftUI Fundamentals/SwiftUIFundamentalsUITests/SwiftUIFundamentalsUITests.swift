//
//  SwiftUIFundamentalsUITests.swift
//  SwiftUIFundamentalsUITests
//
//  Created by Akshay Kumar on 17/05/24.
//

import XCTest

final class SwiftUIFundamentalsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                
                let app = XCUIApplication()
                app.collectionViews/*@START_MENU_TOKEN@*/.images["state-management"]/*[[".cells.images[\"state-management\"]",".images[\"state-management\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
                
                let collectionViewsQuery = XCUIApplication().collectionViews
                collectionViewsQuery.staticTexts["Filter"].tap()
                collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Display Order"]/*[[".cells.staticTexts[\"Display Order\"]",".staticTexts[\"Display Order\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                                app.navigationBars["Your Reading!!!"].staticTexts["Your Reading!!!"].tap()
                XCUIApplication().launch()
            }
        }
    }
}
