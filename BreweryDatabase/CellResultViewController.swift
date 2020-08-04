//
//  CellResultViewController.swift
//  BreweryDatabase
//
//  Created by Tommy Bennett on 10/31/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import UIKit
import SiestaUI


private let reuseIdentifier = "Cell"

class CellResultViewController: UIViewController {

    var beer = Beer(id: "", name: "", abv: "", description: "", labels: Images(
        icon: "",
        medium: "",
        large: "",
        contentAwareIcon: "",
        contentAwareMedium: "",
        contentAwareLarge: ""
    ))

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var remoteImageView: RemoteImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remoteImageView.imageURL = beer.labels.contentAwareLarge
        nameLabel.text = beer.name
        abvLabel.text = beer.abv
        descriptionLabel.text = beer.description
    }
}
