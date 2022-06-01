class RecapViewControllerFactory {
    
    static private let serviceLocator = ServiceLocator()
    
    static func makeRecapViewController() -> RecapViewController {
        let presenter = RecapViewPresenterConcretion(
            getCharactersUseCase: serviceLocator.getCharactersUseCase
        )
        let recapViewController = RecapViewController(
            viewDataSource: RecapViewDataSource(),
            viewDelegate: RecapViewDelegate(),
            presenter: presenter
        )
        presenter.view = recapViewController
        return recapViewController
    }
    
}
