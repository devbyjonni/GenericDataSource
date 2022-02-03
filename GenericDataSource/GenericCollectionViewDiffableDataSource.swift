//
//  GenericCollectionViewDiffableDataSource.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-03.
//

import UIKit

class GenericCollectionViewDiffableDataSource<Section:SectionProtocol, Model:ModelProtocol>: UICollectionViewDiffableDataSource<Section, Model> {
    
    private var modelController: ModelController
    
    init(modelController: ModelController, collectionView: UICollectionView, cellProvider: @escaping UICollectionViewDiffableDataSource<Section, Model>.CellProvider) {
        self.modelController = modelController
        super.init(collectionView: collectionView, cellProvider: cellProvider)
    }
    
    func update(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Model>()
        modelController.sections.forEach { section in
            snapshot.appendSections(modelController.sections as! [Section])
            snapshot.appendItems(section.data as! [Model])
        }
        apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
