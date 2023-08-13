//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by k1d_dev on 13/08/23.
//

import UIKit

final class MovieDetailCell: UICollectionViewCell {
    
    private let movieBannerImage: UIImageView = {
        let movieBannerImage = UIImageView()
        movieBannerImage.translatesAutoresizingMaskIntoConstraints = false
        movieBannerImage.contentMode = .scaleToFill
        movieBannerImage.layer.masksToBounds = true
        movieBannerImage.layer.cornerRadius = 10.0
        return movieBannerImage
    }()
    
    private let movieRatingLabel: UILabel = {
        let movieRatingLabel = UILabel()
        movieRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        return movieRatingLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        return descriptionLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Movie) {
        if let posterPath = model.posterPath, let url = URL(string: "\(AppConstants.imagePath)\(posterPath)") {
            self.movieBannerImage.loadImage(from: url)
        }
    }
    
    private func setupViews() {
        contentView.addSubview(movieBannerImage)
        contentView.addSubview(movieRatingLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            self.movieBannerImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            self.movieBannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.movieBannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.movieBannerImage.heightAnchor.constraint(equalToConstant: 450)
        ])
    }
    
}
