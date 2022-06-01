import Alamofire

class RickAndMortyApiNetwork: ApiNetwork {
    
    func request(url: String, onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: CharactersList.self) { response in
            if let charactersList = response.value?.results {
                onCompletion(.success(charactersList))
            } else {
                onCompletion(.failure(ApiCallError(message: "Error")))
            }
        }
    }
    
}
