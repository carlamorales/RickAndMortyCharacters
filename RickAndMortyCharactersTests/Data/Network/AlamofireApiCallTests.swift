import XCTest
@testable import RickAndMortyCharacters

class AlamofireApiCallTests: XCTestCase {
    var sut: AlamofireApiCall!
    var network: RickAndMortyApiNetworkMock!
    
    override func setUp() {
        super.setUp()
        network = RickAndMortyApiNetworkMock()
        sut = AlamofireApiCall(network: network)
    }
    
    override func tearDown() {
        sut = nil
        network = nil
        super.tearDown()
    }
    
    func testFetchData() {
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
        network.shouldSucceed = false
        let expectation = expectation(description: "testFetchDataFailure")
        sut.fetchData { result in
            switch result {
            case .success:
                XCTFail("Fail :(")
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.message, "Error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
}
