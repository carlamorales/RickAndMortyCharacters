import UIKit

class DetailViewController: UIViewController {
    
    var detailTable = UITableView()
    var content: Character?

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
        switch indexPath.row {
        case .zero:
            let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell") as! DetailPictureTableViewCell
            cell.characterPictureImageView.downloaded(from: content?.image ?? "")
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 260
        default:
            return 100
        }
    }
}
