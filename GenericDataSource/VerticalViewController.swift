//
//  VerticalViewController.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-02.
//

import UIKit

class VerticalViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: GenericCollectionViewDiffableDataSource<Shoe, Hand>! = nil
    var modelController: ModelController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelController.fetchData()
        configureDataSource()
        
        let collectionViewLayout = VerticalCompositionalLayout(itemPerRow: 6, contentInsets: 2)
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataSource.update(animatingDifferences: false)
    }
    
    private func configureDataSource() {
        dataSource = GenericCollectionViewDiffableDataSource(modelController: modelController, collectionView: collectionView) { (collectionView, indexPath, model) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
            cell.titleLabel.text = model.title
            cell.contentView.backgroundColor = UIColor(displayP3Red: .random(in: .random(in: 1...1)...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: .random(in: 0...1))
            
            return cell
        }
        collectionView.dataSource = dataSource
        dataSource.update(animatingDifferences: false)
    }
    
    @IBAction func addItem(_ sender: Any) {
        modelController.createItem()
        dataSource.update()
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        modelController.deleteItem()
        dataSource.update()
    }
}
