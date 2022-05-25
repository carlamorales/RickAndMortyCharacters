class RecapViewPresenterConcretion: RecapViewPresenter {
    
    private let getCharactersUseCase: GetCharactersUseCase
    weak var view: RecapView?
    
    init(getCharactersUseCase: GetCharactersUseCase) {
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func getCharacters() {
        getCharactersUseCase.execute { [weak self] result in
            switch result {
            case .success(let characters):
                self?.view?.displayCharacters(characters)
            case .failure(let error):
                self?.view?.displayError(error)
            }
        }
    }
    
}
