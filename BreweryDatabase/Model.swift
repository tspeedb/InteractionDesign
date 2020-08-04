
let TESTING_UI = "UI_TESTING"

struct SearchParams {
    let query: String
}

struct SearchResult: Codable, Equatable {
    let data: [Beer]
}

struct Beer: Codable, Equatable {
    let id: String
    let name: String
    let abv: String
    let description: String?
    let labels: Images
}

struct Images: Codable, Equatable {
    let icon: String
    let medium: String
    let large: String
    let contentAwareIcon: String
    let contentAwareMedium: String
    let contentAwareLarge: String
}


