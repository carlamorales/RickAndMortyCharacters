import XCTest
@testable import RickAndMortyCharacters

class DetailViewControllerFactoryTests: XCTestCase {
    var sut: DetailViewControllerFactory!
    
    override func setUp() {
        super.setUp()
        sut = DetailViewControllerFactory()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDetailViewControllerFactory() {
        let viewControllerFactory = DetailViewControllerFactory.makeDetailViewController()
        XCTAssertTrue((viewControllerFactory as Any) is DetailViewController)
    }
}
