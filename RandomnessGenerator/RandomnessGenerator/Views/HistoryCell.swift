//
//  HistoryCellTableViewCell.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 07.12.2020.
//

import UIKit

class HistoryCell: UITableViewCell {

    static let reuseIdentifier = "HistoryCellTableViewCell"
    
    var labelDate: UILabel! = nil
    var labelRandomNumber: UILabel! = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.backgroundColor = .orange //UIColor(red: 230, green: 152, blue: 50, alpha: 1)
        setupLabelDate()
        setupLabelRandomNumber()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLabelDate() {
        labelDate = UILabel(frame: .zero)
        labelDate.textColor = .white
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelDate)
        NSLayoutConstraint.activate(
            [
                labelDate.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                labelDate.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                labelDate.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
            ]
        )
    }
    
    private func setupLabelRandomNumber() {
        labelRandomNumber = UILabel(frame: .zero)
        labelRandomNumber.translatesAutoresizingMaskIntoConstraints = false
        labelRandomNumber.textColor = .gray
        addSubview(labelRandomNumber)
        
        NSLayoutConstraint.activate(
            [
                labelRandomNumber.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                labelRandomNumber.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                labelRandomNumber.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                labelRandomNumber.heightAnchor.constraint(equalTo: labelDate.heightAnchor)
                
            ]
        )
        
    }
    
    

}
