@testable import RickAndMortyCharacters

class ApiRestMock: ApiRest {
    
    var shouldFail = false
    
    func fetchData(onCompletion: @escaping (Result<[Character], ApiCallError>) -> Void) {
        if shouldFail {
            onCompletion(.failure(ApiCallError(message: "")))
        } else {
            onCompletion(.success([]))
        }
    }

}
