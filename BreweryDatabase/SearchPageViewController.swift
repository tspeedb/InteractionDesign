//
//  SearchPageViewController.swift
//  BreweryDatabase
//
//  Created by Tommy Bennett on 10/24/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import Foundation
import UIKit

class SearchPageViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBeerImage: UIImageView!
    
    
    override func viewDidLoad() {
        let alert = UIAlertController(title: "Welcome!",
            message: "When searching please enter the exact name of the beer you are looking for",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Acknowledge", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        super.viewDidLoad()
        
    }
    
    override public func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.isNavigationBarHidden = true
     }

     override public func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         navigationController?.isNavigationBarHidden = false
     }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        return true
    }
    
    //MARK: Actions
    
// Prep for naviagation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using [segue destinationViewController].
       // Pass the selected object to the new view controller.
       if let SearchResultTableViewController = segue.destination as? SearchResultTableViewController,
          let query = searchTextField.text {
              SearchResultTableViewController.searchParams = SearchParams(query: query)
          }
    }
    
}
