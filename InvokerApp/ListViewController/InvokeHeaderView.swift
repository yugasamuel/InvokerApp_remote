//
//  InvokeHeaderView.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 11/01/24.
//

import UIKit

class InvokeHeaderView: UICollectionReusableView {
    static var elementKind: String { UICollectionView.elementKindSectionHeader }
    
    var elements: [String] = ["", "", ""] {
        didSet {
            setNeedsLayout()
            firstElement.image = UIImage(named: elements[0])
            secondElement.image = UIImage(named: elements[1])
            thirdElement.image = UIImage(named: elements[2])
        }
    }
    
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
        containerView.distribution = .equalCentering
        containerView.spacing = 4
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.15).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        firstElement.image = UIImage(named: elements[0])
        firstElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        firstElement.widthAnchor.constraint(equalToConstant: 44).isActive = true
        firstElement.heightAnchor.constraint(equalTo: firstElement.widthAnchor, multiplier: 1).isActive = true
        
        secondElement.image = UIImage(named: elements[1])
        secondElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        secondElement.widthAnchor.constraint(equalToConstant: 44).isActive = true
        secondElement.heightAnchor.constraint(equalTo: secondElement.widthAnchor, multiplier: 1).isActive = true
        
        thirdElement.image = UIImage(named: elements[2])
        thirdElement.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        thirdElement.widthAnchor.constraint(equalToConstant: 44).isActive = true
        thirdElement.heightAnchor.constraint(equalTo: thirdElement.widthAnchor, multiplier: 1).isActive = true
    }
}
