//
//  SaleCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Max on 24.08.2023.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    private let saleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(saleImage)
    }
    
    func configureCell(imageName: String) {
        saleImage.image = UIImage(named: imageName)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            saleImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            saleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            saleImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
