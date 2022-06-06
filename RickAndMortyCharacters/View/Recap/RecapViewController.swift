import UIKit
import DemoLib

class RecapViewController: UIViewController {
    
    private var viewDataSource: RecapViewDataSource?
    private var viewDelegate: RecapViewDelegate?
    private var presenter: RecapViewPresenter?
    
    var recapTable = UITableView()
    var charactersArray: [Character] = []
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    var shouldCellBeExtended = false
    
    convenience init(
        viewDataSource:RecapViewDataSource,
        viewDelegate: RecapViewDelegate,
        presenter: RecapViewPresenter
    ) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        prepareTableDelegates()
        prepareFetchData()
    }
    
    private func prepareTable() {
        view.addSubview(recapTable)
        recapTable.pin(to: view)
        //recapTable.register(RecapTableViewCell.self, forCellReuseIdentifier: "recapCell")
        recapTable.register(Cell.self, forCellReuseIdentifier: "1")
        title = "CHARACTERS RECAP"
    }
    
    private func prepareTableDelegates() {
        recapTable.dataSource = viewDataSource
        viewDataSource?.view = self
        recapTable.delegate = viewDelegate
        viewDelegate?.view = self
    }
    
    private func prepareFetchData() {
        presenter?.getCharacters()
    }
    
}

extension RecapViewController: RecapView {
    func displayCharacters(_ list: [Character]) {
        charactersArray = list
        DispatchQueue.main.async {
            self.recapTable.reloadData()
        }
    }
    
    func displayError(_ error: DomainError) {
        print(DomainError(description: ""))
    }
    
    func navigateToNextViewController(character: Character) {
        let detailViewController = DetailViewControllerFactory.makeDetailViewController()
        detailViewController.character = character
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
