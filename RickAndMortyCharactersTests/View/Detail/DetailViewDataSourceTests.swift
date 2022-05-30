import XCTest
@testable import RickAndMortyCharacters

class DetailViewDataSourceTests: XCTestCase {
    var sut: DetailViewDataSource!
    var viewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        sut = DetailViewDataSource()
        viewController = DetailViewController()
        sut.view = viewController
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSection() {
        viewController.character = Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        let rows = sut.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 5)
    }
    
    func testCellForRowAtWithCustomPictureCell() {
        viewController.character = Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        let tableView = viewController.view.subviews[0] as! UITableView
        let pictureCell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! DetailPictureTableViewCell
        XCTAssertTrue((pictureCell as Any) is DetailPictureTableViewCell)
    }
    
    func testCellForRowAtWithCustomTextCell() {
        viewController.character = Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        let tableView = viewController.view.subviews[0] as! UITableView
        for row in 1...4 {
            let textCell = sut.tableView(tableView, cellForRowAt: IndexPath(row: row, section: 0)) as! DetailTextTableViewCell
            XCTAssertTrue((textCell as Any) is DetailTextTableViewCell)
        }
    }
    
    func testCellForRowAtWithDefaultCell() {
        viewController.character = Character(identifier: 0, name: "cero", status: "cero", species: "cero", image: "cero")
        let tableView = viewController.view.subviews[0] as! UITableView
        let defaultCell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 5, section: 0))
        XCTAssertTrue((defaultCell as Any) is UITableViewCell)
    }
    
}
