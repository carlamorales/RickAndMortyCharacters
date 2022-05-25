class ServiceLocator {
    private let apiRest = ApiCall()
    private let apiCallErrorToDomainErrorMapper = ApiCallErrorToDomainErrorMapper()
    
    private var repository: RickAndMortyCharactersRepository {
        return RickAndMortyCharactersRepository(
            apiRest: apiRest,
            apiCallErrorToDomainErrorMapper: apiCallErrorToDomainErrorMapper
        )
    }
    
    var getCharactersUseCase: GetCharactersUseCase {
        return GetCharactersUseCase(repository: repository)
    }
}
