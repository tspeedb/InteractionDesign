import Foundation

protocol Api {
    func api(host: String)
    func searchBeers(with params: SearchParams,
            then: ((SearchResult) -> Void)?,
            fail: ((Error) -> Void)?) // catch is a reserved word so we can't use that.
}

class ApiService: Api {
    func searchBeers(with params: SearchParams,
                     then: ((SearchResult) -> Void)?,
                     fail: ((Error) -> Void)?) {
        if let callback = then {
            callback(SearchResult(data: [
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
            ]))
        }
    }
    
    func api(host: String) {
        // No-op in our initial mock version.
    }

    
    
}
