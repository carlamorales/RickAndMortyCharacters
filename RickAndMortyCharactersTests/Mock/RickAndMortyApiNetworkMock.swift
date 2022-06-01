@testable import RickAndMortyCharacters

class RickAndMortyApiNetworkMock: ApiNetwork {
    var shouldSucceed = true
    
    func request(url: String, onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        if shouldSucceed {
            onCompletion(.success([]))
        } else {
            onCompletion(.failure(ApiCallError(message: "Error")))
        }
        
    }
}
