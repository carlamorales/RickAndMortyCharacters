import UIKit

class DetailViewController: UIViewController {
    
    var detailTable = UITableView()
    var characterModel: Character?

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
            cell.content = characterModel
            return cell
        case 1:
            return prepareTextCell(tableView, key: "Id:", value: "\(characterModel?.identifier ?? 0)")
        case 2:
            return prepareTextCell(tableView, key: "Name:", value: characterModel?.name ?? "")
        case 3:
            return prepareTextCell(tableView, key: "Status:", value: characterModel?.status ?? "")
        case 4:
            return prepareTextCell(tableView, key: "Species:", value: characterModel?.species ?? "")
        default:
            return UITableViewCell()
        }
    }
    
    private func prepareTextCell(_ tableView: UITableView, key: String, value: String) -> DetailTextTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") as! DetailTextTableViewCell
        cell.keyLabel.text = key
        cell.valueLabel.text = value
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 260
        default:
            return 80
        }
    }
}
