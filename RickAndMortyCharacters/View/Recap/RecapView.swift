import UIKit

protocol RecapView: AnyObject {
    func displayCharacters(_ list: [Character])
    func displayError(_ error: DomainError)
    
    func navigateToNextViewController(character: Character)
    
    var recapTable: UITableView { get set }
    var charactersArray: [Character] { get set }
    
    var selectedIndex: IndexPath { get set }
    var shouldCellBeExtended: Bool { get set }
    
}
