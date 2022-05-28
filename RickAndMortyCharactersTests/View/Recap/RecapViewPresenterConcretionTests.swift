import XCTest
@testable import RickAndMortyCharacters

class RecapViewPresenterConcretionTests: XCTestCase {
    var sut: RecapViewPresenterConcretion!
    var repository: RepositoryMock!
    var recapView: RecapViewMock!
    
    override func setUp() {
        super.setUp()
        let charactersArray = [
            Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        ]
        let selectedIndex = IndexPath(row: 0, section: 0)
        let shouldCellBeExtended = false
        recapView = RecapViewMock(
            recapTable: UITableView(),
            charactersArray: charactersArray,
            selectedIndex: selectedIndex,
            shouldCellBeExtended: shouldCellBeExtended
        )
        repository = RepositoryMock()
        let getCharactersUseCase = GetCharactersUseCase(repository: repository)
        sut = RecapViewPresenterConcretion(getCharactersUseCase: getCharactersUseCase)
        sut.view = recapView
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        recapView = nil
        super.tearDown()
    }
    
    func testGetCharactersSuccess() {
        sut.getCharacters()
        XCTAssertTrue(recapView.displayCharactersCalled)
        XCTAssertFalse(recapView.displayErrorCalled)
    }
    
    func testGetCharactersFailure() {
        repository.shouldFail = true
        sut.getCharacters()
        XCTAssertTrue(recapView.displayErrorCalled)
        XCTAssertFalse(recapView.displayCharactersCalled)
    }
}
