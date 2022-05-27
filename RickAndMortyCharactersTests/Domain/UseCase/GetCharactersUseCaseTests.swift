import XCTest
@testable import RickAndMortyCharacters

class GetCharactersUseCaseTests: XCTestCase {
    var sut: GetCharactersUseCase!
    var repository: RepositoryMock!
    
    override func setUp() {
        super.setUp()
        repository = RepositoryMock()
        sut = GetCharactersUseCase(repository: repository)
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
        super.tearDown()
    }
    
    func testExecuteSuccess() {
        let expectation = expectation(description: "testExecuteSuccess")
        sut.execute { result in
            switch result {
            case .success(let characters):
                XCTAssertNotNil(characters)
            case .failure:
                XCTFail("Fail :(")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testExecuteFailure() {
        repository.shouldFail = true
        let expectation = expectation(description: "testExecuteFailure")
        sut.execute { result in
            switch result {
            case .success:
                XCTFail("Fail :(")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}
