import UIKit

class RecapTableViewCell: UITableViewCell {
    
    let characterNameLabel = UILabel()
    let characterSpeciesLabel = UILabel()
    let characterPictureImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareCell()
        prepareCellStyles()
        prepareCellConstraints()
    }
    
    private func prepareCell() {
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(characterSpeciesLabel)
        contentView.addSubview(characterPictureImageView)
    }
    
    private func prepareCellStyles() {
        characterNameLabel.font = UIFont.systemFont(ofSize: 20)
        characterSpeciesLabel.font = UIFont.systemFont(ofSize: 20)
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
            characterNameLabel.topAnchor.constraint(equalTo: characterPictureImageView.topAnchor, constant: 8),
            characterNameLabel.leadingAnchor.constraint(equalTo: characterPictureImageView.trailingAnchor),
        ])
        
        characterSpeciesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterSpeciesLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 16),
            characterSpeciesLabel.leadingAnchor.constraint(equalTo: characterPictureImageView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
