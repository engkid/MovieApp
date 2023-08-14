//
//  SeeMoreReusableView.swift
//  MovieApp
//
//  Created by k1d_dev on 14/08/23.
//

import UIKit

final class SeeMoreReusableView: UICollectionReusableView {
    
    private let seeMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See More", for: .normal)
        button.backgroundColor = UIColor(red: 18/255.0, green: 191/255.0, blue: 222/255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    var seeMoreButtonTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        seeMoreButton.addTarget(self, action: #selector(seeMoreButtonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func seeMoreButtonAction() {
        seeMoreButtonTapped?()
    }
    
    private func setupViews() {
        addSubview(seeMoreButton)
        
        NSLayoutConstraint.activate([
            seeMoreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            trailingAnchor.constraint(equalTo: seeMoreButton.trailingAnchor, constant: 8.0),
            seeMoreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            seeMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            bottomAnchor.constraint(equalTo: seeMoreButton.bottomAnchor, constant: 8.0)
        ])
    }
}
