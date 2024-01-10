//
//  InvokeFooterView.swift
//  InvokerApp
//
//  Created by Yuga Samuel on 10/01/24.
//

import UIKit

class InvokeFooterView: UICollectionReusableView {
    static var elementKind: String { UICollectionView.elementKindSectionFooter }
    
    private var containerView = UIStackView(frame: .zero)
    private var quasImage = UIImageView(frame: .zero)
    private var wexImage = UIImageView(frame: .zero)
    private var exortImage = UIImageView(frame: .zero)
    private var invokeImage = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        containerView.addArrangedSubview(quasImage)
        containerView.addArrangedSubview(wexImage)
        containerView.addArrangedSubview(exortImage)
        containerView.addArrangedSubview(invokeImage)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        quasImage.translatesAutoresizingMaskIntoConstraints = false
        wexImage.translatesAutoresizingMaskIntoConstraints = false
        exortImage.translatesAutoresizingMaskIntoConstraints = false
        invokeImage.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.distribution = .equalSpacing
        containerView.spacing = 16
        
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1)
            .isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        
        wexImage.image = UIImage(named: "Wex")
        wexImage.widthAnchor.constraint(equalToConstant: 54).isActive = true
        wexImage.heightAnchor.constraint(equalTo: wexImage.widthAnchor, multiplier: 1).isActive = true
        wexImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        quasImage.image = UIImage(named: "Quas")
        quasImage.widthAnchor.constraint(equalToConstant: 54).isActive = true
        quasImage.heightAnchor.constraint(equalTo: quasImage.widthAnchor, multiplier: 1).isActive = true
        quasImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        exortImage.image = UIImage(named: "Exort")
        exortImage.widthAnchor.constraint(equalToConstant: 54).isActive = true
        exortImage.heightAnchor.constraint(equalTo: exortImage.widthAnchor, multiplier: 1).isActive = true
        exortImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        invokeImage.image = UIImage(named: "Invoke")
        invokeImage.widthAnchor.constraint(equalToConstant: 54).isActive = true
        invokeImage.heightAnchor.constraint(equalTo: invokeImage.widthAnchor, multiplier: 1).isActive = true
        invokeImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true


        backgroundColor = .gray
    }
}
