import UIKit

class DetailPictureTableViewCell: UITableViewCell {
    
    let characterPictureImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareCell()
        prepareCellStyles()
        prepareCellConstraints()
    }
    
    private func prepareCell() {
        contentView.addSubview(characterPictureImageView)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
