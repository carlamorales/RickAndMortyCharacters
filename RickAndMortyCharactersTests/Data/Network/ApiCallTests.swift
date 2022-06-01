import XCTest
import Mimic
@testable import RickAndMortyCharacters

class ApiCallTests: XCTestCase {
    var sut: ApiCall!
    
    override func setUp() {
        super.setUp()
        Mimic.start()
        sut = ApiCall()
    }
    
    override func tearDown() {
        sut = nil
        Mimic.stopAllMimics()
        super.tearDown()
    }
    
    func testFetchData() {
        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
        let body: [String: Any] = [
            "results": []
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchData")
        sut.fetchData { result in
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
    
    func testFetchDataFailure() {
        let request = request(with: .get, url: "https://rickandmortyapi.com/api/character")
        let body: [String: Any] = [
            "invalidKey": []
        ]
        let response = response(with: body)
        Mimic.mimic(request: request, response: response)
        
        let expectation = expectation(description: "testFetchDataFailure")
        sut.fetchData { result in
            switch result {
            case .success:
                XCTFail("Fail :(")
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.message, "Invalid Model")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}
