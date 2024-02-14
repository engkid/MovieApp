//
//  MovieListCell.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//

import UIKit
import SkeletonView

final class MovieListCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
		titleLabel.skeletonTextNumberOfLines = 2
		titleLabel.isSkeletonable = true
        return titleLabel
    }()

    private let moviePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10.0
		imageView.isSkeletonable = true
        return imageView
    }()
    
    private let yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.font = UIFont.systemFont(ofSize: 14)
		yearLabel.skeletonTextNumberOfLines = 1
		yearLabel.isSkeletonable = true
        return yearLabel
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
            self.moviePoster.loadImage(from: url)
        }
        
        self.titleLabel.text = model.title
        self.yearLabel.text = model.releaseDate.formatToHumanReadableDate(inputFormat: "yyyy-MM-dd", outputFormat: "d MMMM yyyy")
    }
	
	func showShimmer() {
		moviePoster.showGradientSkeleton()
		titleLabel.showGradientSkeleton()
		yearLabel.showGradientSkeleton()
	}
	
	func hideShimmer() {
		moviePoster.hideSkeleton()
		titleLabel.hideSkeleton()
		yearLabel.hideSkeleton()
	}
    
    private func setupViews() {
        
        contentView.addSubview(moviePoster)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        
        NSLayoutConstraint.activate([
            self.moviePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.moviePoster.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            self.moviePoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.moviePoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            self.moviePoster.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8.0),
            self.moviePoster.heightAnchor.constraint(equalToConstant: 257),
            self.titleLabel.centerXAnchor.constraint(equalTo: moviePoster.centerXAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.titleLabel.bottomAnchor.constraint(equalTo: yearLabel.topAnchor, constant: -8.0),
            self.yearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0),
            self.yearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0),
            self.yearLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            self.yearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0)
        ])
    }
    
}
