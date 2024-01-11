//
//  SpellListViewController+Actions.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import UIKit

extension SpellListViewController {
    @objc func didPressResetButton(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
    @objc func didPressGuideButton(_ sender: UIBarButtonItem) {
        let viewController = SpellGuideListViewController() { [weak self] in
            self?.dismiss(animated: true)
        }
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
    }
}
