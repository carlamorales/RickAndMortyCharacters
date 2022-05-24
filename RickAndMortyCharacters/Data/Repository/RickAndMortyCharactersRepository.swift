class RickAndMortyCharactersRepository: Repository {
    
    private let apiRest: ApiRest
    private let apiCallErrorToDomainErrorMapper: Mapper<DomainError, ApiCallError>
    
    init(apiRest: ApiRest, apiCallErrorToDomainErrorMapper: Mapper<DomainError, ApiCallError>) {
        self.apiRest = apiRest
        self.apiCallErrorToDomainErrorMapper = apiCallErrorToDomainErrorMapper
    }
    
    func fetch(onCompletion: @escaping ([Character]?, DomainError?) -> Void) {
        apiRest.fetchData { characters, error in
            if let characters = characters {
                let list = characters
                onCompletion(list, nil)
            } else {
                let domainError = self.apiCallErrorToDomainErrorMapper.reverseMap(value: error ?? ApiCallError(message: ""))
                onCompletion(nil, domainError)
            }
        }
    }
    
}
