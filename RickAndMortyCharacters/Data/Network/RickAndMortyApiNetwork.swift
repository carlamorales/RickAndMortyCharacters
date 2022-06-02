import AFNetworkingModule

class RickAndMortyApiNetwork: ApiNetwork {
    
    func request(url: String, onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        AFNetworkingModule().networkingModule(url: url) { (result: Result<CharactersList, ApiCallError>) in
            switch result {
            case .success(let list):
                onCompletion(.success(list.results))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
