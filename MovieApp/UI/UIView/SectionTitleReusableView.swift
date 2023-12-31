//
//  SectionTitleReusableView.swift
//  MovieApp
//
//  Created by k1d_dev on 13/08/23.
//

import UIKit

final class SectionTitleReusableView: UICollectionReusableView {

    public static var kind: String {
        return String(describing: SectionTitleReusableView.self)
    }
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with title: String?) {
        guard let title else { return }
        
        titleLabel.text = title
    }
}

// MARK: - Private
private extension SectionTitleReusableView {
    func setupViews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
