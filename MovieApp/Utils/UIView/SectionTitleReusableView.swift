//
//  SectionTitleReusableView.swift
//  MovieApp
//
//  Created by Engkit on 13/08/23.
//

import UIKit

final class SectionTitleReusableView: UICollectionReusableView {

    public static var kind: String {
        return String(describing: SectionTitleReusableView.self)
    }
    
    private let titleLabel = UILabel()
    
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
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
