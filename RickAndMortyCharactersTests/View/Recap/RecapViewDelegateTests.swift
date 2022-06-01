import XCTest
@testable import RickAndMortyCharacters

class RecapViewDelegateTests : XCTestCase {
    var sut: RecapViewDelegate!
    var viewController: RecapViewController!
    var recapView: RecapViewMock!
    
    override func setUp() {
        super.setUp()
        sut = RecapViewDelegate()
        viewController = RecapViewController()
        let charactersArray = [Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")]
        let selectedIndex = IndexPath(row: 0, section: 0)
        let shouldCellBeExtended = false
        recapView = RecapViewMock(recapTable: UITableView(), charactersArray: charactersArray, selectedIndex: selectedIndex, shouldCellBeExtended: shouldCellBeExtended)
        sut.view = recapView
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        recapView = nil
        super.tearDown()
    }
    
    func testNavigateToNextViewController() {
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(recapView.navigateToNextViewControllerCalled)
    }
    
    func testDidSelectRowAtWithViewNil() {
        sut.view = nil
        let tableView = viewController.view.subviews[0] as! UITableView
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(!recapView.navigateToNextViewControllerCalled)
    }
    
    func testHeightForRowAtWithShrinkedCell() {
        let tableView = viewController.view.subviews[0] as! UITableView
        let height = sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(height, 100.0)
    }
}
