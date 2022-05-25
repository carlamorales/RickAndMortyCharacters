class RecapViewPresenterConcretion: RecapViewPresenter {
    private let getCharactersUseCase: GetCharactersUseCase
    weak var view: RecapView?
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func getCharacters() {
        getCharactersUseCase.execute { [weak self] characters, error in
            if let characters = characters {
                self?.view?.displayCharacters(characters)
            } else {
                self?.view?.displayError(error ?? DomainError(description: ""))
            }
        }
    }
}
