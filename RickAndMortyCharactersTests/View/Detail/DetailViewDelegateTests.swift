import XCTest
@testable import RickAndMortyCharacters

class DetailViewDelegateTests: XCTestCase {
    var sut: DetailViewDelegate!
    var viewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        viewController = DetailViewController()
        sut = DetailViewDelegate()
        sut.view = viewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testHeightForRowAtCaseZero() {
        let tableView = viewController.view.subviews[0] as! UITableView
        let height = sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(height, 260.0)
    }
    
    func testHeightForRowAtCaseDefault() {
        let tableView = viewController.view.subviews[0] as! UITableView
        let height = sut.tableView(tableView, heightForRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(height, 80.0)
    }
}
