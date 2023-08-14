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
    
    private let synopsisLabel: UILabel = {
        let synopsisLabel = UILabel()
        synopsisLabel.translatesAutoresizingMaskIntoConstraints = false
        synopsisLabel.text = "Synopsis"
        synopsisLabel.font = UIFont.boldSystemFont(ofSize: 23)
        return synopsisLabel
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
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
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
        
        self.movieRatingLabel.attributedText = makeRatingText(model: model)
        self.descriptionLabel.text = model.overview
    }
    
    private func makeRatingText(model: Movie) -> NSMutableAttributedString {
        let boldAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 16)
            ]
        let voteAverageText = NSAttributedString(string: "\(model.voteAverage)", attributes: boldAttributes)
        let voteCountText = NSAttributedString(string: "\(model.voteCount)", attributes: boldAttributes)
        
        let ratingText = NSMutableAttributedString()
        ratingText.append(NSAttributedString(string: "Average rating: "))
        ratingText.append(voteAverageText)
        ratingText.append(NSAttributedString(string: " out of "))
        ratingText.append(voteCountText)
        ratingText.append(NSAttributedString(string: " votes"))
        
        return ratingText
    }
    
    private func setupViews() {
        contentView.addSubview(movieBannerImage)
        contentView.addSubview(synopsisLabel)
        contentView.addSubview(movieRatingLabel)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            self.movieBannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.movieBannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.movieBannerImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.movieBannerImage.heightAnchor.constraint(equalToConstant: 450),
            self.movieBannerImage.bottomAnchor.constraint(equalTo: movieRatingLabel.topAnchor, constant: -8.0),
            self.synopsisLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.synopsisLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.synopsisLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -8.0),
            self.movieRatingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.movieRatingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.movieRatingLabel.bottomAnchor.constraint(equalTo: synopsisLabel.topAnchor, constant: -8.0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0)
        ])
    }
    
}
