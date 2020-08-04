//
//  BreweryDatabaseTests.swift
//  BreweryDatabaseTests
//
//  Created by Tommy Bennett on 10/17/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import XCTest
@testable import BreweryDatabase

class BreweryDatabaseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testShouldReturnTheCorrectNumberOfSectionsAndItems() {
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
            XCTFail()
            return
        }
        
        searchResultTableViewController.searchResultBeers =  [
           Beer(id: "zfP2fK", name: "12th Of Never", abv: "5.5", description: "desc of 12th", labels: Images(
                    icon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    medium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    large: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareIcon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareMedium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareLarge: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png"
                )
            ),

            Beer(id: "MqTIG4", name: "72 Imperial", abv: "7.2", description: "desc of 72", labels: Images(
                    icon: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-icon.png",
                    medium: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-medium.png",
                    large: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-large.png",
                    contentAwareIcon: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-contentAwareIcon.png",
                    contentAwareMedium: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-contentAwareMedium.png",
                    contentAwareLarge: "https://brewerydb-images.s3.amazonaws.com/beer/MqTIG4/upload_0mNn6W-contentAwareLarge.png"
                    )),
            Beer(id: "6AcqY6", name: "Agave Wheat", abv: "5.9", description: "desc of Agave", labels: Images(
                icon: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-icon.png",
                medium: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-medium.png",
                large: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-large.png",
                contentAwareIcon: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-contentAwareIcon.png",
                contentAwareMedium: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-contentAwareMedium.png",
                contentAwareLarge: "https://brewerydb-images.s3.amazonaws.com/beer/6AcqY6/upload_NDHDT6-contentAwareLarge.png"
            ))
            ]

        guard let tableView = searchResultTableViewController.tableView else {
            XCTFail()
            return
        }

        XCTAssertEqual(1, searchResultTableViewController.numberOfSections(in: tableView))
        XCTAssertEqual(3, searchResultTableViewController.tableView(tableView, numberOfRowsInSection: 0))
    }
    
    
    func testShouldTriggerBeerSearchWhenSearchResultTableViewControllerLoads() {
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
            XCTFail()
            return
        }

        searchResultTableViewController.api = TestApiService()
        searchResultTableViewController.searchParams = SearchParams(query: "Budweiser")
        searchResultTableViewController.viewDidLoad()
        // Asserts are in the TestApiService implementation, see below.
    }
    
    func testShouldDisplayAlertWhenAPICallFails() {
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
            XCTFail()
            return
        }

        var failureCallbackWasCalled = false
        searchResultTableViewController.failureCallback = { _ in failureCallbackWasCalled = true }

        searchResultTableViewController.api = FailingApiService()
        searchResultTableViewController.searchParams = SearchParams(query: "Budweiser")
        searchResultTableViewController.viewDidLoad()

        XCTAssert(failureCallbackWasCalled)
    }


    func testSearchResultTableCallsAlert(){
        //Alert should be called when searchParams == ""
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
                    XCTFail()
                    return
        }
        
        var failureCallbackWasCalled = false
        searchResultTableViewController.failureCallback = { _ in failureCallbackWasCalled = true }

        searchResultTableViewController.api = FailingApiService()
        searchResultTableViewController.searchParams = SearchParams(query: "")
        searchResultTableViewController.viewDidLoad()

        XCTAssert(failureCallbackWasCalled)
        
        
        }
    
    func testSearchResultTableViewControllerTableView() {
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
            XCTFail()
            return
        }

        searchResultTableViewController.api = TestApiService()
        searchResultTableViewController.searchParams = SearchParams(query: "Budweiser")
        searchResultTableViewController.viewDidLoad()
        // Asserts are in the TestApiService implementation, see below.
        guard let tableView = searchResultTableViewController.tableView else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(1, searchResultTableViewController.numberOfSections(in: tableView))
        XCTAssertEqual(0, searchResultTableViewController.tableView(tableView, numberOfRowsInSection: 0))
        
    }
    
    func testIndividualCell() {
        guard let searchResultTableViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "SearchResultTableViewController")
                as? SearchResultTableViewController else {
            XCTFail()
            return
        }
        
        searchResultTableViewController.searchResultBeers =  [
        Beer(id: "zfP2fK", name: "12th Of Never", abv: "5.5", description: "desc of 12th", labels: Images(
                 icon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                 medium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                 large: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                 contentAwareIcon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                 contentAwareMedium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                 contentAwareLarge: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png"
             ))
            ]
        
        XCTAssertEqual("12th Of Never", searchResultTableViewController.searchResultBeers.first?.name)
        
    }
}
    
    class TestApiService: Api {
        func api(host: String) {
        }

        func searchBeers(with params: SearchParams,
                then: ((SearchResult) -> Void)?,
                fail: ((Error) -> Void)?) {
            // For this test, we don't call the callback because we just want to make sure the right parameters were sent.
            XCTAssertEqual(params.query, "Budweiser")
        }
    }

class FailingApiService: Api {
    func api(host: String) {
    }

    func searchBeers(with params: SearchParams,
            then: ((SearchResult) -> Void)?,
            fail: ((Error) -> Void)?) {
        // For this test, we call the fail function unconditionally because we want to test the error.
        if let callback = fail {
            callback(NSError(domain: "test", code: 0, userInfo: nil))
        }
    }
}

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

