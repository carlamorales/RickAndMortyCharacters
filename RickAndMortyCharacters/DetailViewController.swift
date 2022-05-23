import UIKit

class DetailViewController: UIViewController {
    
    var detailTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTable()
        prepareTableDelegates()
    }
    
    private func prepareTable() {
        view.addSubview(detailTable)
        detailTable.pin(to: view)
        detailTable.register(DetailPictureTableViewCell.self, forCellReuseIdentifier: "pictureCell")
        title = "CHARACTERS DETAIL"
    }
    
    private func prepareTableDelegates() {
        detailTable.dataSource = self
        detailTable.delegate = self
    }

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension DetailViewController: UITableViewDelegate {}
