import XCTest
@testable import RickAndMortyCharacters

class RickAndMortyCharactersRepositoryTests: XCTestCase {
    var sut: RickAndMortyCharactersRepository!
    var apiRest: ApiRestMock!
    
    override func setUp() {
        let apiCallErrorToDomainErrorMapper = ApiCallErrorToDomainErrorMapper()
        apiRest = ApiRestMock()
        sut = RickAndMortyCharactersRepository(
            apiRest: apiRest,
            apiCallErrorToDomainErrorMapper: apiCallErrorToDomainErrorMapper
        )
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        apiRest = nil
        super.tearDown()
    }
    
    func testFetchSuccess() {
        let expectation = expectation(description: "testFetchSuccess")
        sut.fetch { result in
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
    
    func testFetchFailure() {
        apiRest.shouldFail = true
        let expectation = expectation(description: "testFetchFailure")
        sut.fetch { result in
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
