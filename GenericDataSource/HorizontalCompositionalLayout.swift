//
//  HorizontalCompositionalLayout.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-03.
//

import UIKit

class HorizontalCompositionalLayout: UICollectionViewCompositionalLayout {
    
    private var contentInsets: CGFloat = 0.0
    init(itemPerRow: Int, contentInsets: CGFloat = 0.0) {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: contentInsets, leading: contentInsets, bottom: contentInsets, trailing: contentInsets)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0 / CGFloat(itemPerRow)), heightDimension: .fractionalHeight(1.0))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 )
        section.orthogonalScrollingBehavior = .continuous
        
        super.init(section: section)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VerticalCompositionalLayout: UICollectionViewCompositionalLayout {
    
    private var contentInsets: CGFloat = 0.0
    init(itemPerRow: Int, contentInsets: CGFloat = 0.0) {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0 / CGFloat(itemPerRow)), heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: contentInsets, leading: contentInsets, bottom: contentInsets, trailing: contentInsets)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0 / CGFloat(itemPerRow)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0 )
//        section.orthogonalScrollingBehavior = .continuous
        
        super.init(section: section)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
