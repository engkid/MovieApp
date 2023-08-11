//
//  MovieListCell.swift
//  MovieApp
//
//  Created by Engkit on 11/08/23.
//

import UIKit

final class GenreListCell: UICollectionViewCell {
    
    private let genreLabel: UILabel = {
        let genreLabel = UILabel()
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.text = "DummyGenre"
        return genreLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: MovieGenre) {
        self.genreLabel.text = model.name
    }
    
    private func setupViews() {
        
        contentView.addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            self.genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.genreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            self.genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)
        ])
    }
    
}
