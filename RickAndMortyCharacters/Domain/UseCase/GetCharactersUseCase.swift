struct GetCharactersUseCase {
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func execute(onCompletion: @escaping ([Character]?, DomainError?) -> Void) {
        repository.fetch { characters, error in
            onCompletion(characters, error)
        }
    }
}
