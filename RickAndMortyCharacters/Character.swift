struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

struct CharactersList: Decodable {
    let results: [Character]
}

struct ApiCallError {
    let message: String
}
