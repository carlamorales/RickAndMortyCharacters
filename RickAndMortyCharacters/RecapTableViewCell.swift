import UIKit

class RecapTableViewCell: UITableViewCell {
    
    var character: Character? {
        didSet {
            prepareCell()
            prepareCellStyles()
            prepareCellConstraints()
        }
    }
    
    private let characterNameLabel = UILabel()
    private let characterSpeciesLabel = UILabel()
    private let characterStatusLabel = UILabel()
    private let characterPictureImageView = UIImageView()
    let expandAndContractCellButton = UIButton()
    
    private func prepareCell() {
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterSpeciesLabel)
        contentView.addSubview(characterStatusLabel)
        contentView.addSubview(characterPictureImageView)
        contentView.addSubview(expandAndContractCellButton)
        
        characterNameLabel.text = character?.name
        characterSpeciesLabel.text = character?.species
        characterStatusLabel.text = character?.status
        characterPictureImageView.downloaded(from: character?.image ?? "")
    }
    
    private func prepareCellStyles() {
        characterNameLabel.font = UIFont.systemFont(ofSize: 20)
        characterSpeciesLabel.font = UIFont.systemFont(ofSize: 20)
        characterStatusLabel.font = UIFont.systemFont(ofSize: 20)
        expandAndContractCellButton.backgroundColor = .black
        expandAndContractCellButton.layer.cornerRadius = 5
        expandAndContractCellButton.setTitle("Click", for: .normal)
        expandAndContractCellButton.setTitleColor(.white, for: .normal)
        contentView.clipsToBounds = true
    }
    
    private func prepareCellConstraints() {
        characterPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterPictureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterPictureImageView.heightAnchor.constraint(equalToConstant: 80),
            characterPictureImageView.widthAnchor.constraint(equalTo: characterPictureImageView.heightAnchor, multiplier: 16/9),
        ])
        
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterPictureImageView.trailingAnchor),
        ])
        
        characterSpeciesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 16),
            characterSpeciesLabel.leadingAnchor.constraint(equalTo: characterPictureImageView.trailingAnchor),
        ])
        
        characterStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterStatusLabel.topAnchor.constraint(equalTo: characterSpeciesLabel.bottomAnchor, constant: 16),
            characterStatusLabel.leadingAnchor.constraint(equalTo: characterPictureImageView.trailingAnchor),
        ])
        
        expandAndContractCellButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expandAndContractCellButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            expandAndContractCellButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            expandAndContractCellButton.heightAnchor.constraint(equalToConstant: 35),
            expandAndContractCellButton.widthAnchor.constraint(equalToConstant: 75),
        ])
    }
    
}
