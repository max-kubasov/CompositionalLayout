//
//  MockData.swift
//  CompositionalLayout
//
//  Created by Max on 23.08.2023.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([.init(title: "", image: "salesBurger"),
                .init(title: "", image: "salesPizza"),
                .init(title: "", image: "salesWok")])
    }()
    
    var pageData: [ListSection] {
        [sales]
    }
}
