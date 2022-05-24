import UIKit

class RecapViewController: UIViewController {
    
    var recapTable = UITableView()
    var charactersArray: [Character] = []
    var repository: Repository?

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
        recapTable.dataSource = self
        recapTable.delegate = self
    }
    
    private func prepareFetchData() {
        repository?.fetch(onCompletion: { characters, error in
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
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    var shouldCellBeExtended = false
    
}

extension RecapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recapCell") as! RecapTableViewCell
        cell.character = charactersArray[indexPath.row]
        
        cell.expandAndContractCellButton.addTarget(self, action: #selector(expandAndContractCell(sender:)), for: .touchUpInside)
        cell.expandAndContractCellButton.tag = indexPath.row
        
        return cell
    }
    
    @objc func expandAndContractCell(sender: UIButton) {
        selectedIndex = IndexPath(row: sender.tag, section: 0)
        shouldCellBeExtended.toggle()
        recapTable.beginUpdates()
        recapTable.reloadRows(at: [selectedIndex], with: .automatic)
        recapTable.endUpdates()
    }
}

extension RecapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.character = charactersArray[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if shouldCellBeExtended && selectedIndex == indexPath {
            return 150
        }
        return 100
    }
}
