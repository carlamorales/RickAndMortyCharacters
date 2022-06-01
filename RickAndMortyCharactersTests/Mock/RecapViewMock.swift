import UIKit
@testable import RickAndMortyCharacters

class RecapViewMock: RecapView {
    
    var displayCharactersCalled = false
    var displayErrorCalled = false
    var navigateToNextViewControllerCalled = false
    
    var recapTable: UITableView
    var charactersArray: [Character]
    
    var selectedIndex: IndexPath
    var shouldCellBeExtended: Bool
    
    init(recapTable: UITableView, charactersArray: [Character], selectedIndex: IndexPath, shouldCellBeExtended: Bool) {
        self.recapTable = recapTable
        self.charactersArray = charactersArray
        self.selectedIndex = selectedIndex
        self.shouldCellBeExtended = shouldCellBeExtended
    }
    
    func displayCharacters(_ list: [Character]) {
        displayCharactersCalled = true
    }
    
    func displayError(_ error: DomainError) {
        displayErrorCalled = true
    }
    
    func navigateToNextViewController(character: Character) {
        navigateToNextViewControllerCalled = true
    }
    
}
