import UIKit

class RecapViewDelegate: NSObject {
    weak var view: RecapView?
}

extension RecapViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let view = view else {
            return
        }
        let character = view.charactersArray[indexPath.row]
        view.navigateToNextViewController(character: character)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if view?.shouldCellBeExtended ?? false && view?.selectedIndex == indexPath {
            return 150
        }
        return 100
    }
}
