//
//  SpellListViewController+DataSource.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

extension SpellListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Spell.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Spell.ID>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Spell.ID) {
        let spell = spell(withId: id)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = spell.spellName
        contentConfiguration.secondaryText = spell.elementsAbbreviation
        contentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        contentConfiguration.image = UIImage(named: spell.spellName)
        contentConfiguration.imageProperties.maximumSize = CGSize(width: 44, height: 44)
        
        cell.contentConfiguration = contentConfiguration
        
        let backgroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        cell.backgroundConfiguration = backgroundConfiguration
    }
    
    func updateSnapshot(reloading ids: [Spell.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(spellsInvoked.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    
    func spell(withId id: Spell.ID) -> Spell {
        let index = spellsInvoked.indexOfSpell(withId: id)
        return spellsInvoked[index]
    }
}
