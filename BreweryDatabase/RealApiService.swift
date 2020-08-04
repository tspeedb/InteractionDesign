//
//  RealApiService.swift
//  BreweryDatabase
//
//  Created by Tommy Bennett on 11/10/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import Siesta

class RealApiService: Api {

    let API_KEY = "0494019102d489d4a25e9273f0b67a21"

    private var service = Service(
        baseURL: "http://misconfigured.app.com",
        standardTransformers: [.text, .image])

    init() {
        // Bare-bones logging of which network calls Siesta makes:
        SiestaLog.Category.enabled = [.network]

        // For more info about how Siesta decides whether to make a network call,
        // and which state updates it broadcasts to the app:
        //SiestaLog.Category.enabled = SiestaLog.Category.common
        // For the gory details of what Siesta’s up to:
        //SiestaLog.Category.enabled = SiestaLog.Category.all
        // To dump all requests and responses:
        // (Warning: may cause Xcode console overheating)
        //SiestaLog.Category.enabled = SiestaLog.Category.all
    }

    func api(host: String) {
        service = Service(baseURL: host, standardTransformers: [.text, .image])

        let jsonDecoder = JSONDecoder()
        service.configureTransformer("/beers") {
            try jsonDecoder.decode(SearchResult.self, from: $0.content)
        }
    }

    func searchBeers(with params: SearchParams,
            then: ((SearchResult) -> Void)?,
            fail: ((Error) -> Void)?) {
        service.resource("/beers")
            .withParam("key", API_KEY)
            .withParam("name", params.query)
        .request(.get).onSuccess { result in
            if let searchResult: SearchResult = result.typedContent(),
               let callback = then {
                callback(searchResult)
            }
        }.onFailure { error in
            //gets here
            if let callback = fail {
                callback(error)
            }
        }
    }
}
