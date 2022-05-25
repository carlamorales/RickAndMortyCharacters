protocol Repository {
    func fetch(onCompletion: @escaping (Result <[Character], DomainError>) -> Void)
}
