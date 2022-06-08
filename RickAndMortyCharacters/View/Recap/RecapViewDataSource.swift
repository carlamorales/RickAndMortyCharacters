import UIKit
import DemoLib

class RecapViewDataSource: NSObject {
    weak var view: RecapView?
}

extension RecapViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return view?.charactersArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let view = view else {
//            return UITableViewCell()
//        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "1", for: indexPath) as! Cell
        let cellContent = view?.charactersArray[indexPath.row]
        cell.prepare()
        cell.setCellValues(
            name: cellContent?.name ?? "",
            species: cellContent?.species ?? "",
            status: cellContent?.status ?? "",
            image: cellContent?.image ?? ""
        )
        
        cell.expandAndContractCellButton.addTarget(self, action: #selector(expandAndContractCell(sender:)), for: .touchUpInside)
        cell.expandAndContractCellButton.tag = indexPath.row
        
        return cell
    }
    
    @objc func expandAndContractCell(sender: UIButton) {
        guard let view = view else {
            return
        }
        view.selectedIndex = IndexPath(row: sender.tag, section: 0)
        view.shouldCellBeExtended.toggle()
        view.recapTable.beginUpdates()
        view.recapTable.reloadRows(at: [view.selectedIndex], with: .automatic)
        view.recapTable.endUpdates()
    }
}
