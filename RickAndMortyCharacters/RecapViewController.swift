import UIKit

class RecapViewController: UIViewController {
    
    var recapTable = UITableView()
    var charactersArray: [Character] = []

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
        ApiCall.sharedInstance.fetchData { characters, error in
            DispatchQueue.main.async {
                guard let characters = characters else {
                    print(error?.message ?? "Error")
                    return
                }
                self.charactersArray = characters
                self.recapTable.reloadData()
            }
        }
    }
    
}

extension RecapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recapCell") as! RecapTableViewCell
        cell.content = charactersArray[indexPath.row]
        return cell
    }
}

extension RecapViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
