//
//  MovieListCell.swift
//  MovieApp
//
//  Created by k1d_dev on 11/08/23.
//

import UIKit
import SkeletonView

final class GenreListCell: UICollectionViewCell {
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.text = "DummyGenre"
		genreLabel.isHiddenWhenSkeletonIsActive = true
        return genreLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MovieGenre) {
        self.genreLabel.text = model.name
    }
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layoutSkeletonIfNeeded()
	}
    
    private func setupViews() {
		self.isSkeletonable = true
		
        contentView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            self.genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.genreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)
        ])
    }
    
}
