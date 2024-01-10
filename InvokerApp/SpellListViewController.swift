//
//  ViewController.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

class SpellListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var spells: [Spell] = Spell.sampleData
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Spell.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Spell.ID>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    func listLayout() -> UICollectionViewCompositionalLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Spell.ID) {
        let spell = spell(withId: id)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = spell.spellName
        contentConfiguration.secondaryText = spell.elementsAbbreviation
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        contentConfiguration.image = UIImage(named: spell.spellName)
        cell.contentConfiguration = contentConfiguration
        
        let backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    func updateSnapshot(reloading ids: [Spell.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(spells.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    
    func spell(withId id: Spell.ID) -> Spell {
        let index = spells.indexOfSpell(withId: id)
        return spells[index]
    }
}

