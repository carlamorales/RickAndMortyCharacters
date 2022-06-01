@testable import RickAndMortyCharacters

class RepositoryMock: Repository {
    
    var shouldFail = false
    
    func fetch(onCompletion: @escaping (Result<[Character], DomainError>) -> Void) {
        if shouldFail {
            onCompletion(.failure(DomainError(description: "")))
        } else {
            onCompletion(.success([]))
        }
    }
    
}
