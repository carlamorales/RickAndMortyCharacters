import UIKit

class DetailPictureTableViewCell: UITableViewCell {
    
    var character: Character? {
        didSet {
            prepareCell()
            prepareCellStyles()
            prepareCellConstraints()
        }
    }
    
    private let characterPictureImageView = UIImageView()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterPictureImageView.image = UIImage(named: "placeholder")
    }
    
    private func prepareCell() {
        contentView.addSubview(characterPictureImageView)
        characterPictureImageView.image = UIImage(named: "placeholder")
        characterPictureImageView.downloaded(from: character?.image ?? "")
    }
    
    private func prepareCellStyles() {
        characterPictureImageView.clipsToBounds = true
        characterPictureImageView.layer.cornerRadius = 10
    }
    
    private func prepareCellConstraints() {
        characterPictureImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterPictureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterPictureImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterPictureImageView.heightAnchor.constraint(equalToConstant: 240),
            characterPictureImageView.widthAnchor.constraint(equalToConstant: 240),
        ])
    }

}
