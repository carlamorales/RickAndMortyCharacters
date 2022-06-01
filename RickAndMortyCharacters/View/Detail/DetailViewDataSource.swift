import UIKit

class DetailViewDataSource: NSObject {
    weak var view: DetailViewController?
}

extension DetailViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case .zero:
            let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell") as! DetailPictureTableViewCell
            cell.character = view?.character
            return cell
        case 1:
            return prepareTextCell(tableView, key: "Id:", value: "\(view?.character?.identifier ?? 0)")
        case 2:
            return prepareTextCell(tableView, key: "Name:", value: view?.character?.name ?? "")
        case 3:
            return prepareTextCell(tableView, key: "Status:", value: view?.character?.status ?? "")
        case 4:
            return prepareTextCell(tableView, key: "Species:", value: view?.character?.species ?? "")
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
