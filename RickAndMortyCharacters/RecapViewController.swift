import UIKit

class RecapViewController: UIViewController {
    
    var recapTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(recapTable)
        recapTable.pin(to: view)
        title = "CHARACTERS RECAP"
        
        recapTable.dataSource = self
        recapTable.delegate = self
    }

}

extension RecapViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension RecapViewController: UITableViewDelegate {}
