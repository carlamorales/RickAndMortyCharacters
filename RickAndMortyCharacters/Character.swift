struct Character: Decodable {
    let identifier: Int
    let name: String
    let status: String
    let species: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case status
        case species
        case image
    }
}

struct CharactersList: Decodable {
    let results: [Character]
}

struct ApiCallError {
    let message: String
}
