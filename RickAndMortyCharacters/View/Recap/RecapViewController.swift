import UIKit

class RecapViewController: UIViewController {
    
    private var viewDataSource: RecapViewDataSource?
    private var viewDelegate: RecapViewDelegate?
    
    var recapTable = UITableView()
    var charactersArray: [Character] = []
    var getCharactersUseCase: GetCharactersUseCase?
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    var shouldCellBeExtended = false
    
    convenience init(viewDataSource:RecapViewDataSource, viewDelegate: RecapViewDelegate) {
        self.init()
        self.viewDataSource = viewDataSource
        self.viewDelegate = viewDelegate
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
        recapTable.register(RecapTableViewCell.self, forCellReuseIdentifier: "recapCell")
        title = "CHARACTERS RECAP"
    }
    
    private func prepareTableDelegates() {
        recapTable.dataSource = viewDataSource
        viewDataSource?.view = self
        recapTable.delegate = viewDelegate
        viewDelegate?.view = self
    }
    
    private func prepareFetchData() {
        getCharactersUseCase?.execute(onCompletion: { characters, error in
            DispatchQueue.main.async {
                guard let characters = characters else {
                    print(error as Any)
                    return
                }
                self.charactersArray = characters
                self.recapTable.reloadData()
            }
        })
    }
    
}
