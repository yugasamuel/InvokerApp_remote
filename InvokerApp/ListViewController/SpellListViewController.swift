//
//  ViewController.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

class SpellListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var spellsInvoked: [Spell] = Spell.sampleData
    var currentElements: [Spell.Element] = [.None, .None, .None]
    var headerView: InvokeHeaderView?
    var toolbarView: InvokeToolbarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration(
            elementKind: InvokeHeaderView.elementKind, handler: supplementaryRegistrationHandler)
        dataSource.supplementaryViewProvider = { supplementaryView, elementKind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: indexPath)
        }
        
        toolbarView = InvokeToolbarView(onChange: { [weak self] element in
            self?.appendNewElement(element)
        }, onInvoke: { [weak self] in
            self?.invokeSpell()
        })
        let invokeToolbar = UIBarButtonItem(customView: toolbarView!)
        toolbarItems = [invokeToolbar]
        navigationController?.isToolbarHidden = false
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    private func appendNewElement(_ element: Spell.Element) {
        if currentElements[0] == .None {
            currentElements.insert(element, at: 0)
            currentElements.removeLast()
        } else if currentElements[1] == .None {
            currentElements.insert(element, at: 1)
            currentElements.removeLast()
        } else if currentElements[2] == .None {
            currentElements.insert(element, at: 2)
            currentElements.removeLast()
        } else {
            currentElements.append(element)
            currentElements.removeFirst()
        }
        
        updateSnapshot()
    }
    
    private func invokeSpell() {
        let invokedSpell = Spell(elements: currentElements)
        spellsInvoked.insert(invokedSpell, at: 0)
        updateSnapshot()
    }
    
    func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard elementKind == InvokeHeaderView.elementKind, let headerView = view as? InvokeHeaderView else {
            return
        }
        
        let elements = currentElements.map { $0.rawValue }
        headerView.elements = elements
    }

    private func supplementaryRegistrationHandler(invokeHeaderView: InvokeHeaderView, elementKind: String, indexPath: IndexPath) {
        headerView = invokeHeaderView
    }
}

