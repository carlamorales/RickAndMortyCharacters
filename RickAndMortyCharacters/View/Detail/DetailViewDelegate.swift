import UIKit

class DetailViewDelegate: NSObject {
    weak var view: DetailViewController?
}

extension DetailViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case .zero:
            return 260
        default:
            return 80
        }
    }
}
