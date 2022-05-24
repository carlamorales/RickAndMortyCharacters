protocol Repository {
    func fetch(onCompletion: @escaping ([Character]?, DomainError?) -> Void)
}
