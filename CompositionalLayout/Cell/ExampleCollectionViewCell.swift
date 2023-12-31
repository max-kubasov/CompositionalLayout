//
//  ExampleCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Max on 24.08.2023.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    private let burgerImageView: UIImageView = {
       let burgerImageView = UIImageView()
        burgerImageView.contentMode = .scaleAspectFill
        burgerImageView.image = UIImage(named: "burger1")
        burgerImageView.translatesAutoresizingMaskIntoConstraints = false
        return burgerImageView
    }()
    
    private let backgroundTitleView: UIView = {
        let backgroundTitleView = UIView()
        backgroundTitleView.backgroundColor = .white
        backgroundTitleView.alpha = 0.6
        backgroundTitleView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundTitleView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Egg to burger"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$7.42"
        label.textColor = .red
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(burgerImageView)
        addSubview(backgroundTitleView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func configureCell(imageName: String) {
        burgerImageView.image = UIImage(named: imageName)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10)
        ])
    }
    
}
