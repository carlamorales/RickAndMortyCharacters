protocol RecapView: AnyObject {
    func displayCharacters(_ list: [Character])
    func displayError(_ error: DomainError)
}
