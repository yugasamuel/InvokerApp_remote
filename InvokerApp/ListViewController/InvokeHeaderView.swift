//
//  InvokeHeaderView.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import UIKit

class InvokeHeaderView: UICollectionReusableView {
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    
    var elements: [String] = ["", "", ""]
    
    private let containerView = UIStackView(frame: .zero)
    private let firstElement = UIImageView(frame: .zero)
    private let secondElement = UIImageView(frame: .zero)
    private let thirdElement = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func prepareSubviews() {
        addSubview(containerView)
        containerView.addArrangedSubview(firstElement)
        containerView.addArrangedSubview(secondElement)
        containerView.addArrangedSubview(thirdElement)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        firstElement.translatesAutoresizingMaskIntoConstraints = false
        secondElement.translatesAutoresizingMaskIntoConstraints = false
        thirdElement.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        containerView.spacing = 16
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        firstElement.image = UIImage(named: elements[0])
        firstElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        firstElement.widthAnchor.constraint(equalToConstant: 50).isActive = true
        firstElement.heightAnchor.constraint(equalTo: firstElement.widthAnchor, multiplier: 1).isActive = true
        
        secondElement.image = UIImage(named: elements[1])
        secondElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        secondElement.widthAnchor.constraint(equalToConstant: 50).isActive = true
        secondElement.heightAnchor.constraint(equalTo: secondElement.widthAnchor, multiplier: 1).isActive = true
        
        thirdElement.image = UIImage(named: elements[2])
        thirdElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        thirdElement.widthAnchor.constraint(equalToConstant: 50).isActive = true
        thirdElement.heightAnchor.constraint(equalTo: thirdElement.widthAnchor, multiplier: 1).isActive = true
    }
}
