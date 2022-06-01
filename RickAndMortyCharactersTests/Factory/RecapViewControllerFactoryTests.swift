import XCTest
@testable import RickAndMortyCharacters

class RecapViewControllerFactoryTests: XCTestCase {
    var sut: RecapViewControllerFactory!
    
    override func setUp() {
        super.setUp()
        sut = RecapViewControllerFactory()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testRecapViewControllerFactory() {
        let viewControllerFactory = RecapViewControllerFactory.makeRecapViewController()
        XCTAssertTrue((viewControllerFactory as Any) is RecapViewController)
    }
}
