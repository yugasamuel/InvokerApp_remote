//
//  ViewController.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

class SpellListViewController: UICollectionViewController {
    var dataSource: DataSource!
    var spellsInvoked: [Spell] = []
    var currentElements: [Spell.Element] = [.None, .None, .None]
    var headerView: InvokeHeaderView?
    var toolbarView: InvokeToolbarView?
    var spellsStorage = SpellsStorage()
    
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
        
        configureToolbar()
        configureBarButtons()
        
        spellsInvoked = spellsStorage.loadSpells()
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.backgroundView = nil
        let backgroundView = UIImageView(image: .invokerDotaBackground)
        backgroundView.contentMode = .scaleAspectFit
        collectionView.backgroundView = backgroundView
    }
    
    func configureToolbar() {
        toolbarView = InvokeToolbarView(onChange: { [weak self] element in
            self?.appendNewElement(element)
        }, onInvoke: { [weak self] in
            self?.invokeSpell()
        })
        let invokeToolbar = UIBarButtonItem(customView: toolbarView!)
        toolbarItems = [invokeToolbar]
        navigationController?.isToolbarHidden = false
    }
    
    func configureBarButtons() {
        let resetButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "arrow.clockwise"), target: self, action: #selector(didPressResetButton(_:)))
        let seeGuideButton = UIBarButtonItem(title: nil, image: UIImage(systemName: "book"), target: self, action: #selector(didPressGuideButton(_:)))
        navigationItem.rightBarButtonItems = [resetButton]
        navigationItem.leftBarButtonItems = [seeGuideButton]
    }
    
    func showAlert() {
        let alertTitle = NSLocalizedString("Rest all spells?", comment: "Alert title")
        let alert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "Yes", style: .default,
                handler: { [weak self] _ in
                    self?.clearAllSpells()
                    self?.dismiss(animated: true)
                })
        )
        alert.addAction(
            UIAlertAction(
                title: "Cancel", style: .cancel,
                handler: { [weak self] _ in
                    self?.dismiss(animated: true)
                })
        )
        
        present(alert, animated: true, completion: nil)
    }
    
    func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.headerMode = .supplementary
        listConfiguration.backgroundColor = .clear
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

