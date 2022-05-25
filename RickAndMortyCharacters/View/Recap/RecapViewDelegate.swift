import UIKit

class RecapViewDelegate: NSObject {
    weak var view: RecapViewController?
}

extension RecapViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let detailViewController = DetailViewController(
            viewDataSource: DetailViewDataSource(),
            viewDelegate: DetailViewDelegate()
        )
        detailViewController.character = view.charactersArray[indexPath.row]
        view.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if view?.shouldCellBeExtended ?? false && view?.selectedIndex == indexPath {
            return 150
        }
        return 100
    }
}
