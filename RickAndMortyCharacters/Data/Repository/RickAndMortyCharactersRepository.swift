class RickAndMortyCharactersRepository: Repository {
    
    private let apiRest: ApiRest
    private let apiCallErrorToDomainErrorMapper: Mapper<DomainError, ApiCallError>
    
    init(apiRest: ApiRest, apiCallErrorToDomainErrorMapper: Mapper<DomainError, ApiCallError>) {
        self.apiRest = apiRest
        self.apiCallErrorToDomainErrorMapper = apiCallErrorToDomainErrorMapper
    }
    
    func fetch(onCompletion: @escaping (Result <[Character], DomainError>) -> Void) {
        apiRest.fetchData { result in
            switch result {
            case .success(let characters):
                onCompletion(.success(characters))
            case .failure(let error):
                let domainError = self.apiCallErrorToDomainErrorMapper.reverseMap(value: error)
                onCompletion(.failure(domainError))
            }
        }
    }
    
}
