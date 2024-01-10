//
//  InvokeFooterView.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

class InvokeToolbarView: UIView {
    private var containerView = UIStackView(frame: .zero)
    private var quasButton = UIButton(type: .custom)
    private var wexButton = UIButton(type: .custom)
    private var exortButton = UIButton(type: .custom)
    private var invokeButton = UIButton(type: .custom)
    
    var onChange: ((Spell.Element) -> Void)
    var onInvoke: (() -> Void)
    
    init(onChange: @escaping (Spell.Element) -> Void, onInvoke: @escaping () -> Void) {
        self.onChange = onChange
        self.onInvoke = onInvoke
        
        super.init(frame: .zero)
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    func prepareSubviews() {
        addSubview(containerView)
        containerView.addArrangedSubview(quasButton)
        containerView.addArrangedSubview(wexButton)
        containerView.addArrangedSubview(exortButton)
        containerView.addArrangedSubview(invokeButton)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        quasButton.translatesAutoresizingMaskIntoConstraints = false
        wexButton.translatesAutoresizingMaskIntoConstraints = false
        exortButton.translatesAutoresizingMaskIntoConstraints = false
        invokeButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        containerView.spacing = 16
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1)
            .isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        quasButton.setImage(UIImage(named: "Quas"), for: .normal)
        quasButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        quasButton.heightAnchor.constraint(equalTo: quasButton.widthAnchor, multiplier: 1).isActive = true
        quasButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        quasButton.addTarget(self, action: #selector(quasTapped(_:)), for: .touchUpInside)
        
        wexButton.setImage(UIImage(named: "Wex"), for: .normal)
        wexButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        wexButton.heightAnchor.constraint(equalTo: wexButton.widthAnchor, multiplier: 1).isActive = true
        wexButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        wexButton.addTarget(self, action: #selector(wexTapped(_:)), for: .touchUpInside)
        
        exortButton.setImage(UIImage(named: "Exort"), for: .normal)
        exortButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        exortButton.heightAnchor.constraint(equalTo: exortButton.widthAnchor, multiplier: 1).isActive = true
        exortButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        exortButton.addTarget(self, action: #selector(exortTapped(_:)), for: .touchUpInside)
        
        invokeButton.setImage(UIImage(named: "Invoke"), for: .normal)
        invokeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        invokeButton.heightAnchor.constraint(equalTo: invokeButton.widthAnchor, multiplier: 1).isActive = true
        invokeButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        invokeButton.addTarget(self, action: #selector(invokeSpells(_:)), for: .touchUpInside)
    }
    
    @objc func quasTapped(_ sender: UIButton) {
        self.onChange(.Quas)
    }
    
    @objc func wexTapped(_ sender: UIButton) {
        self.onChange(.Wex)
    }
    
    @objc func exortTapped(_ sender: UIButton) {
        self.onChange(.Exort)
    }
    
    @objc func invokeSpells(_ sender: UIButton) {
        self.onInvoke()
    }
}
