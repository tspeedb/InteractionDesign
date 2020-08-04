//
//  MockApiService.swift
//  BreweryDatabase
//
//  Created by Tommy Bennett on 10/29/19.
//  Copyright © 2019 Tommy Bennett. All rights reserved.
//

import Foundation

class MockApiService: Api {
    func api(host: String) {
        // No-op in our initial mock version.
    }

    func searchBeers(with params: SearchParams,
            then: ((SearchResult) -> Void)?,
            fail: ((Error) -> Void)?) {
        if let callback = then {
            callback(SearchResult(data: [
                Beer(id: "zfP2fK", name: "12th Of Never", abv: "5.5", description: "is this even called?", labels: Images(
                    icon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    medium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    large: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareIcon: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareMedium: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png",
                    contentAwareLarge: "https://brewerydb-images.s3.amazonaws.com/beer/zfP2fK/upload_nSMNjh-icon.png"
                ))
            ]))
        }
    }
}
