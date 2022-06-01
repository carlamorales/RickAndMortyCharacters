import XCTest
@testable import RickAndMortyCharacters

class RecapViewDataSourceTests: XCTestCase {
    var sut: RecapViewDataSource!
    var viewController: RecapViewController!
    
    override func setUp() {
        super.setUp()
        sut = RecapViewDataSource()
        viewController = RecapViewController()
        sut.view = viewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSection() {
        viewController.charactersArray = [
            Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero"),
            Character(identifier: 1, name: "uno", status: "uno", species: "uno", image: "uno")
        ]
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func testNumberOfRowsInSectionWithViewNil() {
        sut.view = nil
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 0)
    }
    
    func testCellForRowAtWithCustomCell() {
        viewController.charactersArray = [
            Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        ]
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! RecapTableViewCell
        XCTAssertTrue((cell as Any) is RecapTableViewCell)
    }
    
    func testCellForRowAtWithDefaultCell() {
        sut.view = nil
        let tableView = viewController.view.subviews[0] as! UITableView
        let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue((cell as Any) is UITableViewCell)
    }
    
}
