//
//  SearchResultTableViewController.swift
//  BreweryDatabase
//
//  Created by Tommy Bennett on 10/28/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import UIKit

private let REUSE_IDENTIFIER = "productImage"

class SearchResultTableViewController: UITableViewController {
    
    //FOR MOCK GOES ON THE LEFT, REAL API GOES ON RIGHT SIDE OF COLON!!!!!!!!!
    var api: Api = ProcessInfo.processInfo.arguments.contains(TESTING_UI) ?
            ApiService() : RealApiService()

    var failureCallback: ((Error) -> Void)?
    var selectedRow = 0
    var searchParams = SearchParams(query: "")
    var searchResultBeers: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Invoke our query upon loading.
        api.api(host: "https://sandbox-api.brewerydb.com/v2/")
        api.searchBeers(with: searchParams, then: display, fail: failureCallback ?? report)
    }


    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultBeers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
               UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: REUSE_IDENTIFIER, for: indexPath)
               as! SearchResultViewCell

           cell.remoteImageView.imageURL = searchResultBeers[indexPath.row].labels.contentAwareIcon
           cell.beerNameLabel.text = searchResultBeers[indexPath.row].name
                
           return cell
       }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "wholeBeerSegue", sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cellResultViewController = segue.destination as? CellResultViewController {
            cellResultViewController.beer = searchResultBeers[selectedRow]
            
        }
    }
    

    // MARK: UITableViewDelegate
    
    
    private func display(searchResult: SearchResult) {
        searchResultBeers = searchResult.data
        tableView.reloadData()
    }
    
    
    private func report(error: Error) {
        let alert = UIAlertController(title: "Network Issue",
            message: "Sorry, we seem to have encountered a network problem: \(error.localizedDescription)",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        if (searchParams.query == ""){
            let alert = UIAlertController(title: "Invalid Input String",
                message: "Sorry, input string is invalid: \(error.localizedDescription)",
                preferredStyle: .alert)
            

            alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

        
    }
    
}
