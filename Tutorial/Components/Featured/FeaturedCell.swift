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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
    
    private func prepare() {
        contentView.backgroundColor = .systemOrange
    }
    
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 10
    }
}
