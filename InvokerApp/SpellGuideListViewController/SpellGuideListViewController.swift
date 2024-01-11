//
//  SpellGuideListViewController.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import UIKit

class SpellGuideListViewController: UICollectionViewController {
    private typealias DataSource = UICollectionViewDiffableDataSource<Int, Spell.ID>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Spell.ID>
    private var dataSource: DataSource!
    private var spells = Spell.sampleData
    
    var onDismiss: () -> Void
    
    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listConfiguration.showsSeparators = false
        let listLayout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        super.init(collectionViewLayout: listLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initialize SpellGuideListViewController using init(:)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(didDismiss(_:)))
        navigationItem.title = NSLocalizedString("Spell Guide", comment: "View controller title")
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }

    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Spell.ID) {
        let spell = spell(withId: id)
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = spell.spellName
        contentConfiguration.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        contentConfiguration.secondaryAttributedText = spell.elementsJoined
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
    
    @objc func didDismiss(_ sender: UIBarButtonItem) {
        onDismiss()
    }
}
