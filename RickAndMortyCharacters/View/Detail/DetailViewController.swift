import UIKit

class DetailViewController: UIViewController {
    
    private var viewDataSource: DetailViewDataSource?
    private var viewDelegate: DetailViewDelegate?
    
    var detailTable = UITableView()
    var character: Character?
    
    convenience init(viewDataSource: DetailViewDataSource, viewDelegate: DetailViewDelegate) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        prepareTableDelegates()
    }
    
    private func prepareTable() {
        view.addSubview(detailTable)
        detailTable.pin(to: view)
        detailTable.register(DetailPictureTableViewCell.self, forCellReuseIdentifier: "pictureCell")
        detailTable.register(DetailTextTableViewCell.self, forCellReuseIdentifier: "textCell")
        title = "CHARACTER DETAIL"
    }
    
    private func prepareTableDelegates() {
        detailTable.dataSource = viewDataSource
        viewDataSource?.view = self
        detailTable.delegate = viewDelegate
        viewDelegate?.view = self
    }

}
