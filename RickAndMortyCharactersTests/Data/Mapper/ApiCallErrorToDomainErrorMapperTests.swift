import XCTest
@testable import RickAndMortyCharacters

class ApiCallErrorToDomainErrorMapperTests: XCTestCase {
    var sut : ApiCallErrorToDomainErrorMapper!
    
    override func setUp() {
        super.setUp()
        sut = ApiCallErrorToDomainErrorMapper()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testApiCallErrorToDomainErrorMapper() {
        let entity = ApiCallError(message: "")
        let expectedModel = DomainError(description: entity.message)
        let model = sut.reverseMap(value: entity)
        XCTAssertEqual(expectedModel.description, model.description)
    }
}
