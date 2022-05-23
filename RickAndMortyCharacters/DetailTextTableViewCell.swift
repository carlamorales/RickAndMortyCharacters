import UIKit

class DetailTextTableViewCell: UITableViewCell {
    
    let keyLabel = UILabel()
    let valueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareCell()
        prepareCellStyles()
        prepareCellConstraints()
    }
    
    private func prepareCell() {
        contentView.addSubview(keyLabel)
        contentView.addSubview(valueLabel)
    }
    
    private func prepareCellStyles() {
        keyLabel.font = UIFont.boldSystemFont(ofSize: 22)
        valueLabel.font = UIFont.systemFont(ofSize: 22)
        valueLabel.numberOfLines = 0
        valueLabel.lineBreakMode = .byWordWrapping
    }
    
    private func prepareCellConstraints() {
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            keyLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -8),
        ])
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
