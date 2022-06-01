struct GetCharactersUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func execute(onCompletion: @escaping (Result <[Character], DomainError>) -> Void) {
        repository.fetch { characters in
            onCompletion(characters)
        }
    }
}
