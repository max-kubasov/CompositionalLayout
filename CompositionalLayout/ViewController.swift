//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Max on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayot = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayot)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Make order", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Food Shop"
        label.textAlignment = .center
        //label.backgroundColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sections = MockData.shared.pageData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        
        view.addSubview(orderButton)
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: "First")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "Category")
    }
    
    private func setDataSource() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}


// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
            
        case .sales(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "First", for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sale[indexPath.row].image)
            return cell
            
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Example", for: indexPath) as? ExampleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: example[indexPath.row].image)
            return cell
            
        }
        
    }
}


//MARK: Set Constraints

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            orderButton.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            //titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
