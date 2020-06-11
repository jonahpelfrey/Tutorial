//
//  FeaturedCell.swift
//  Tutorial
//
//  Created by Jonah Pelfrey on 6/10/20.
//  Copyright © 2020 Jonah Pelfrey. All rights reserved.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    static let reuseIdentifier: String = "featured-cell"
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText?.uppercased()
        }
    }
    
    var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepare() {
        backgroundColor = .systemBlue
        addShadow(color: UIColor.lightGray, offset: .init(width: 0, height: 10))
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            //titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        
    }
    
    func addShadow(color: UIColor, offset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = offset
        layer.shadowRadius = layer.cornerRadius
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    }
}
