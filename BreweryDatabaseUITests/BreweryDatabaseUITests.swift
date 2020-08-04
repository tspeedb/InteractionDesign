//
//  BreweryDatabaseUITests.swift
//  BreweryDatabaseUITests
//
//  Created by Tommy Bennett on 10/17/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import XCTest

class BreweryDatabaseUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchArguments.append("UI_TESTING")
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testSearchButtonShouldBeEnabledWhenTheSearchFieldIsNotBlank() {
        let searchTextField = app.textFields["searchTextField"]
        
        searchTextField.tap()
        searchTextField.typeText("Budweiser")

        let searchButton = app.buttons["searchButton"]
        XCTAssert(searchButton.isEnabled)
    }


    func testShouldPopulateTheTableViewWhenSearchResultsArrive() {
        let searchTextField = app.textFields["searchTextField"]
        searchTextField.tap()
        searchTextField.typeText("test")

        let searchButton = app.buttons["searchButton"]
        searchButton.tap()
        
        let tableView = app.tableRows["resultTableView"]
        XCTAssertEqual(0, tableView.tableRows.count)
    }
    
    func testAlertThrownForInvalidQuery() {
        let searchTextField = app.textFields["searchTextField"]
        searchTextField.tap()
        searchTextField.typeText("")
        
        let searchButton = app.buttons["searchButton"]
        searchButton.tap()
        
        var alertButton = false
        
        if app.buttons["Acknowledge"].exists {
            alertButton = true
        }
        
        XCTAssertTrue(alertButton)
        
    }

}
